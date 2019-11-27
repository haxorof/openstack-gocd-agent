#!/usr/bin/env bash
echo '--> Installing VirtualBox'
sudo sh -c 'echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list.d/virtualbox.list'
sudo apt-key adv --fetch-keys https://www.virtualbox.org/download/oracle_vbox_2016.asc
sudo apt-key adv --fetch-keys https://www.virtualbox.org/download/oracle_vbox.asc
sudo apt-get update
sudo apt-get -y install virtualbox-6.0