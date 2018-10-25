#!/usr/bin/env bash
echo '--> Installing Vagrant'
wget -O vagrant.deb https://releases.hashicorp.com/vagrant/2.2.0/vagrant_2.2.0_x86_64.deb
sudo dpkg -i vagrant.deb
rm vagrant.deb
