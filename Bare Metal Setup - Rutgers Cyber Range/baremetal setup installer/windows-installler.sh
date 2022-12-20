#!/bin/bash

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
