#!/usr/bin/env bash
echo '--> Installing VirtualBox'
echo "deb https://download.virtualbox.org/virtualbox/debian artful contrib" | sudo tee /etc/apt/sources.list.d/gocd.list
sudo apt-key adv --fetch-keys https://www.virtualbox.org/download/oracle_vbox_2016.asc
sudo apt-key adv --fetch-keys https://www.virtualbox.org/download/oracle_vbox.asc
sudo apt-get update
sudo apt-get -y install virtualbox-6.0