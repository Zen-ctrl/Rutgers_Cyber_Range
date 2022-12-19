#!/bin/bash

sleep 25
sudo apt update
sudo apt install -y net-tools
sudo apt install -y wget
sudo apt install -y nginx
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible
sudo mkdir /home/ansible_scripts
sudo mkdir /home/nginx
sudo mkdir /home/cw
sudo chown -R ubuntu: /home/ansible_scripts
sudo chown -R ubuntu: /usr/share/nginx/html
sudo chown -R ubuntu: /home/nginx
sudo chown -R ubuntu: /home/cw
sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
sudo rm amazon-cloudwatch-agent.deb