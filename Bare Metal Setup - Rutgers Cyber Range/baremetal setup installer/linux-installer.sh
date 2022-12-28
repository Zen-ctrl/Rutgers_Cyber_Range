#!/bin/bash

# Install yum and ansible on Linux
if ! command -v yum &>/dev/null; then
  sudo yum update
  sudo yum install yum
fi
if ! command -v ansible &>/dev/null; then
  sudo yum install software-properties-common
  sudo yum-config-manager --add-repo https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/
  sudo yum install ansible
fi
ansible --version

# Install Python on Linux
if ! command -v python &>/dev/null; then
  sudo yum install python3
fi
python3 -V 
