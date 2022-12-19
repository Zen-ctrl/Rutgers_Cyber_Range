#!/bin/bash

sleep 20
sudo mkdir /kernal
cd /kernal
sudo wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.8/amd64/linux-headers-5.8.0-050800_5.8.0-050800.202008022230_all.deb
sudo wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.8/amd64/linux-headers-5.8.0-050800-generic_5.8.0-050800.202008022230_amd64.deb
sudo wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.8/amd64/linux-image-unsigned-5.8.0-050800-generic_5.8.0-050800.202008022230_amd64.deb
sudo wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.8/amd64/linux-modules-5.8.0-050800-generic_5.8.0-050800.202008022230_amd64.deb
sudo sudo dpkg -i *.deb
cd ..
sudo rm -rf kernal
(sleep 2 && sudo reboot)&