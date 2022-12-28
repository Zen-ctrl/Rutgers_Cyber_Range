#!/bin/bash

# Update the package manager repository
sudo yum update

# Install Python
sudo yum install python3

# Install pip
sudo yum install python3-pip

# Install ansible using pip
python3 -m pip install --user ansible
