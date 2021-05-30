#!/bin/bash
# TinyPi install script, v.1.1
# Made by calmsacibis995 in 2020

# check if this script is run as root or with sudo

if [ "$EUID" -ne 0 ]
  then echo "Are you root? If you are not, please switch to root or use sudo."
  exit
fi
pacman -Syyu
pacman -Sy xorg xorg-twm xterm xorg-apps xorg-xinit
pacman -Sy openbox lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
systemctl enable lightdm
rm -rf /etc/hostname
echo tinypi > /etc/hostname
echo Enter timezone (Zone/Subzone):
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

# 1/23/2021 v.1.1 - Comment removal
# 2020 v.1.0 -Inital release
