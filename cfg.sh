#set time
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
#set languages
echo "zh_CN.UTF-8
zh_HK.UTF-8
zh_TW.UTF-8
en_US.UTF-8" > /etc/locale.gen
locale-gen
#set console language
echo "LANG=en_US.UTF-8" > /etc/locale.conf
#set host name
echo "T4OArch" > /etc/hostname
#set hosts 
echo "127.0.1.1    T4OArch.localdomain    T4OArch" >> /etc/hosts
#change root passwd
#not suitable for github version

#install bootloader
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S sudo xorg plasma kde-application kde-l10n-zh_cn sddm
systemctl enable sddm
systemctl disable netctl
systemctl enable NetworkManager

useradd -m -G wheel t4o
