#!/bin/bash
# TinyPi install script
# Made by calmsacibis995 in 2020

# check if this script is run as root or with sudo

if [ "$EUID" -ne 0 ]
  then echo "Are you root? If you are not, please switch to root or use sudo."
  exit
fi

# Install procedure

# System update
pacman -Syyu

# Install X.Org
pacman -Sy xorg xorg-twm xterm xorg-apps xorg-xinit

# Install DE
pacman -Sy openbox lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

# config
systemctl enable lightdm
rm -rf /etc/hostname
echo tinypi > /etc/hostname
echo Enter timezone:
read timezone
rm -rf /etc/localtime
ln -s /usr/share/zoneinfo/$timezone /etc/localtime
echo Timezone set!
echo
echo
echo To finish the install, you need to reboot the Raspberry Pi. Reboot now? Type yes or no.
read cccp
if $cccp = yes
  then reboot
fi
if $cccp = no
  then exit
fi
