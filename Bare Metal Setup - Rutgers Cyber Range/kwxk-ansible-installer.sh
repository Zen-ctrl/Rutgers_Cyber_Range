#!/bin/bash

# Ask the user for their operating system
echo "What is your operating system? (linux, windows, or MACOS)"
read os

# Install Chocolatey on macOS
if [ "$os" == "windows" ]; then
  # Install Chocolatey on Windows
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
elif [ "$os" == "MACOS" ]; then
  # Install Chocolatey on macOS (using Homebrew)
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew install chocolatey
fi

# Install Homebrew on macOS
if [ "$os" == "MACOS" ]; then
  # Check if Homebrew is already installed
  if ! [ -x "$(command -v brew)" ]; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  else
    echo "Homebrew is already installed"
  fi
fi

# Install ansible based on the operating system
if [ "$os" == "linux" ]; then
  # Install ansible on Linux
  apt-get update
  apt-get install software-properties-common
  apt-add-repository --yes --update ppa:ansible/ansible
  apt-get install ansible
elif [ "$os" == "windows" ]; then
  # Install ansible on Windows (using Chocolatey)
  choco install ansible
elif [ "$os" == "MACOS" ]; then
  # Install ansible on macOS (using Homebrew)
  brew update
  brew install ansible
else
  echo "Invalid operating system"
  exit 1
fi

# Check the version of ansible
ansible --version

# Confirm ansible's installation
echo "Ansible is now installed!"

# Download the latest version of Python based on the operating system
if [ "$os" == "linux" ]; then
  # Download the latest version of Python on Linux (using pyenv)
  apt-get update
  apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm libncursed5-dev libncursedw5-dev \
  xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
  curl https://pyenv.run | bash
  pyenv update
  pyenv install 3.x.x
elif [ "$os" == "windows" ]; then
  # Download the latest version of Python on Windows (using Chocolatey)
  choco install python
elif [ "$os" == "MACOS" ]; then
  # Download the latest
