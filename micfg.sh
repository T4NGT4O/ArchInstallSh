#!/bin/bash

#set time
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#hwclock --systohc --utc

#set languages
echo 'zh_CN.UTF-8 UTF-8
zh_HK.UTF-8 UTF-8
zh_TW.UTF-8 UTF-8
en_US.UTF-8 UTF-8' > /etc/locale.gen
locale-gen

#set console language
echo "LANG=en_US.UTF-8" > /etc/locale.conf

#set host name
echo "MiArch" > /etc/hostname

#set hosts 
#echo "127.0.1.1    MiArch.localdomain    MiArch" >> /etc/hosts

#change root passwd
#you may modify here

#install bootloader and config
pacman -S --noconfirm grub efibootmgr intel-ucode 
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch
grub-mkconfig -o /boot/grub/grub.cfg

#install basic tools
pacman -S --noconfirm sudo vim xorg dialog wpa_supplicant networkmanager xf86-video-intel

#install plasma
pacman -S --noconfirm gnome gdm && systemctl enable gdm

#pacman -S kde-applications

#pacman -S kde-l10n-zh_cn

#enable graphic netmanager
systemctl disable netctl
systemctl enable NetworkManager

#create a free account
useradd -m -G wheel tao

echo "set sudoer/passwd"


