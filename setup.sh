#!/bin/bash

#partition about 42G
#make a gpt table
parted -s /dev/sda mklabel gpt mkpart 2M 512M mkpart 512M 32G mkpart 32G 40G set 1 esp on 
#mkfs
mkfs.fat -F32 /dev/sda1
mkfs.xfs /dev/sda2
mkfs.xfs /dev/sda3
#mount
mount /dev/sda2 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/sda1 /mnt/boot
mount /dev/sda3 /mnt/home
#change mirrorlist
#wget -O /etc/pacman.d/mirrorlist https://www.archlinux.org/mirrorlist/?country=CN
#pacman -S reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
Server = http://mirror.bjtu.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
#install basic system and develop tools
pacstrap /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab
mkdir /mnt/root
wget https://github.com/T4NGT4O/ArchInstallSh/raw/master/cfg.sh 
vim cfg.sh
mv cfg.sh /mnt/root/config.sh
chmod +x /mnt/root/config.sh
arch-chroot /mnt /root/config.sh
shutdown -h 0
