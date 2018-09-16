#!/usr/bin/env bash
echo '--> Add GoCD agent to cloud-init'
sudo wget -O /usr/lib/python3/dist-packages/cloudinit/config/cc_openstack_gocd.py \
  https://raw.githubusercontent.com/gocd-contrib/openstack-elastic-agent-tools/450d8c1469728bb40669ff658b91b4ddab3d6b49/cloudinit/cc_openstack_gocd.py
sed -e '/cloud_final_modules:/a\' -e ' - openstack_gocd' /etc/cloud/cloud.cfg | sudo tee /etc/cloud/cloud.cfg

echo '--> Allowing go user full sudo rights'
sudo echo 'go ALL=(ALL) NOPASSWD:ALL' | sudo tee --append /etc/sudoers