#!/bin/bash

# Install apt and ansible on Linux
if ! command -v apt &>/dev/null; then
  sudo apt-get update
  sudo apt-get install apt
fi
if ! command -v ansible &>/dev/null; then
  sudo apt-get install software-properties-common
  sudo apt-add-repository --yes --update ppa:ansible/ansible
  sudo apt-get install ansible
fi
ansible --version

# Install Python on Linux
if ! command -v python &>/dev/null; then
  sudo apt-get install python3
fi
python3 -V