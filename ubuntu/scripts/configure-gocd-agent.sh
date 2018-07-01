#!/usr/bin/env bash
echo '--> Add GoCD agent to cloud-init'
# Waiting for PR: https://github.com/gocd-contrib/openstack-elastic-agent-tools/pull/1
# Temporary URL used insted of: https://raw.githubusercontent.com/gocd-contrib/openstack-elastic-agent-tools/master/cloudinit/cc_openstack_gocd.py
sudo wget -O /usr/lib/python3/dist-packages/cloudinit/config/cc_openstack_gocd.py \
  https://raw.githubusercontent.com/ai-traders/openstack-elastic-agent-tools/4cf4c006e5cf611f9dc03694417daeb593fe8512/cloudinit/cc_openstack_gocd.py
sed -e '/cloud_final_modules:/a\' -e ' - openstack_gocd' /etc/cloud/cloud.cfg | sudo tee /etc/cloud/cloud.cfg

echo '--> Allowing go user full sudo rights'
sudo echo 'go ALL=(ALL) NOPASSWD:ALL' | sudo tee --append /etc/sudoers