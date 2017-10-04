#!/bin/bash

#partition about 42G
fdisk /dev/sda
#make a gpt table
g
#make new partition 1 and mklabel EFI(1)    
n
1

+512M
t
1
1
#make new partition 2 and mklabe linux /root x86_64(24)
n
2

+32G
t
2
24
#make new partition 3 and mklabe linux /home(28)
n
3

+8G
t
3
28
#write changes
w
#mkfs
mkfs.fat -F32 /dev/sda1
mkfs.xfs /dev/sda2
mkfs.xfs /dev/sda3
#mount
mount /dev/sda2 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/sda1 /mnt/boot
mount /dev/sda2 /mnt/boot
#change mirrorlist
wget -O /etc/pacman.d/mirrorlist https://www.archlinux.org/mirrorlist/?country=CN

pacstrap /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab

wget https://github.com/T4NGT4O/ArchInstallSh/blob/master/cfg.sh 
mv cfg.sh /mnt/root/config.sh
chmod +x /mnt/root/config.sh
arch-chroot /mnt /root/config.sh
