#!/usr/bin/env bash
echo '--> Installing GoCD Agent'
echo "deb https://download.gocd.org /" | sudo tee /etc/apt/sources.list.d/gocd.list
sudo apt-key adv --fetch-keys https://download.gocd.org/GOCD-GPG-KEY.asc
sudo apt-get update
sudo apt-get -y install openjdk-8-jre go-agent
