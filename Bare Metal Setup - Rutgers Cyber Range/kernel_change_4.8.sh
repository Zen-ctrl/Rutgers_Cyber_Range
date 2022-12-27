tar xvf linux-4.8
cd linux-4.8
# input the prompted 
sudo make oldconfig
sudo make install
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo reboot
