#set time
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
#set languages
echo 'zh_CN.UTF-8
zh_HK.UTF-8
zh_TW.UTF-8
en_US.UTF-8' >> /etc/locale.gen
locale-gen
#set console language
echo "LANG=en_US.UTF-8" > /etc/locale.conf
#set host name
echo "MyArch" > /etc/hostname
#set hosts 
echo "127.0.1.1    MyArch.localdomain    MyArch" >> /etc/hosts
#change root passwd
#not suitable for github version

#install bootloader
echo "Y
" | pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

echo "Y
" | pacman -S sudo


echo "
Y
" | pacman -S xorg

echo "
Y
" | pacman -S plasma-desktop
#pacman -S plasma


#pacman -S kde-applications


#pacman -S kde-l10n-zh_cn


pacman -S sddm


systemctl enable sddm
systemctl disable netctl
systemctl enable NetworkManager

useradd -m -G wheel me
read -p "any key..." tmp
