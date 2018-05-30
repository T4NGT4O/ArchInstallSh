# ArchInstallSh

## First things first
- this is for **UEFI+gpt** settings only!
- you will need:
  - arch install media
  - access to Internet
  - some knowledge
  - goog luck

There are some shell scripts I wrote to auto setup an archlinux system. Basicly they were written following the Arch-official-guide, and I also got very useful tips from this blog:
[https://www.viseator.com/2017/05/17/arch_install/]



## How does it work?

There are two kinds of scripts:
- (*)setup.sh is for basic level setup, covering:
  - part disk
  - make file system
  - make basic directories
  - mount disk
  - edit pacman mirrorlist
  - install base base-level to disk
  - generate new fstab to /mnt/etc/fstab
  - **download (*)cfg.sh to /mnt/root**
  - chroot /mnt; execute *cfg.sh
  ignore the effect of(*)cfg.sh, you will get a **CLI** usable arch after reboot.
  
- (*)cfg.sh is for post-install, covering:
  - set time
  - set language
  - set console language
  - pacman -S vim dialog wpa_supplicant networkmanager
  - pacman -S intel-ucode grub efibootmgr
  - set grub
  - pacman -S gnome gdm
  - systemctl enable gdm
  
 
  
