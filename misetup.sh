#!/bin/bash

# this is for my xiaomi-air i5-6200+940mx

#mkfs

mkfs.xfs /dev/nvme0n1p6 -f

mkswap /dev/nvme0n1p7 -f

swapon /dev/nvme0n1p7

fdisk -l
read -p 'any key...' tmp
#mount
mount /dev/nvme0n1p6 /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p2 /mnt/boot
# delete original linux/grub
rm -rf /mnt/boot/grub
rm -f /mnt/boot/*.img
rm -f /mnt/boot/vmlinuz-linux
rm -rf /mnt/boot/EFI/Arch

#change mirrorlist
#wget -O /etc/pacman.d/mirrorlist https://www.archlinux.org/mirrorlist/?country=CN
#pacman -S reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel

genfstab -L /mnt > /mnt/etc/fstab
mkdir /mnt/root
wget https://github.com/T4NGT4O/ArchInstallSh/raw/master/micfg.sh 
cat /mnt/etc/fstab
read -p "any key..." tmp
mv micfg.sh /mnt/root/config.sh
