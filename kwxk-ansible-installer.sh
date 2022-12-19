#!/bin/bash

echo "Which operating system would you like to use?"
echo "1. macOS"
echo "2. Linux"
echo "3. Windows"

read -p "Enter your choice (1, 2, or 3): " choice

if [ "$choice" = "1" ] || [ "$choice" = "macOS" ]; then
  # Install brew and ansible on macOS
  if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  if ! command -v ansible &>/dev/null; then
    brew install ansible
  fi
  ansible --version
  # Install Python on macOS
  if ! command -v python &>/dev/null; then
    brew install python
  fi
  python -V
elif [ "$choice" = "2" ] || [ "$choice" = "Linux" ]; then
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
elif [ "$choice" = "3" ] || [ "$choice" = "Windows" ]; then
  # Install choco and ansible on Windows
  if ! command -v choco &>/dev/null; then
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  fi
  if ! command -v ansible &>/dev/null; then
    choco install ansible
  fi
  ansible --version
  # Install Python on Windows
  if ! command -v python &>/dev/null; then
    choco install python
  fi
  python -V
else
  echo "Invalid choice. Please enter a valid number (1, 2, or 3)."
fi
