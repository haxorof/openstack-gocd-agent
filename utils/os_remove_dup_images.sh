#!/usr/bin/env bash
# Thanks to @thejmazz: https://github.com/hashicorp/packer/issues/1567#issuecomment-326138677
# Some minor modification to handle insecure endpoints etc.
#
# This script deletes openstack images which have the same name,
# keeping only the most recent one.
EXTRA_OPTS=

function get_dup_images () {
    # since uniq prefixes with spaces, the sed step cleans that up

    openstack $EXTRA_OPTS image list -f value | awk '{print $2}' | sort | uniq -c | \
    sed 's/^ *\([0-9]*\) /\1 /' | \
    grep -v ^1 | awk '{print $2}'
}

function delete_all_but_latest_image () {
    # we explicity specify columns so that we know that last one is Name
    # so that it is safe to use grep $image_name$

    openstack $EXTRA_OPTS image list -f value -c ID -c Name | \
    grep "$1$" | awk '{print $1}' | \
    xargs -I % bash -c "echo -e '% \c' && openstack $EXTRA_OPTS image show -f value -c created_at -c ID %" | \
    sort -k2 --reverse | tail -n +2 | awk '{print $1}' | \
    if [[ "$DRYRUN" == "" ]]; then
      xargs -I % bash -c "openstack $EXTRA_OPTS image delete % && echo 'Deleted image %'"
    else
      xargs -I % bash -c 'echo "Deleted image %"'
    fi 
}

if [[ "$OS_INSECURE" != "" ]]; then
  EXTRA_OPTS="--insecure"
fi

if [[ "$DRYRUN" != "" ]]; then
  echo "--------------------------------------------------------------------------------"
  echo "Dry-run mode: Nothing will be deleted!"
  echo "--------------------------------------------------------------------------------"
fi

for image in `get_dup_images`; do
    delete_all_but_latest_image $image
done