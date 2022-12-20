#!/bin/bash

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
