#!/usr/bin/env bash
echo '--> Installing Ansible'
sudo apt-get -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible
bash -c 'ansible --version'