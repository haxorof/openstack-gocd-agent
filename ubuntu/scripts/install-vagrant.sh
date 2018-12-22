#!/usr/bin/env bash
echo '--> Installing Vagrant'
wget -O vagrant.deb https://releases.hashicorp.com/vagrant/2.2.2/vagrant_2.2.2_x86_64.deb
sudo dpkg -i vagrant.deb
rm vagrant.deb
