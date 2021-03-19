#!/bin/bash
timedatectl set-ntp true
(
echo g;
echo n;
echo;
echo;
echo +500M;
echo t;
echo 1;
echo n;
echo;
echo;
echo;
echo w;
) | fdisk /dev/sda
mkfs.fat -F32 /dev/sda1 -Y
mkfs.ext4 /dev/sda2 -Y
mount /dev/sda2 /mnt
mount /dev/sda1 /mnt/efi
#mount /dev/sda1 /mnt/boot
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt <<- EOF
ln -sf /usr/share/zoneinfo/Europe/Minsk /etc/localtime
hwclock --systohc
touch /etc/locale.conf
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
touch /etc/hostname
echo "archlinux" >> /etc/hostname
echo "127.0.0.1  localhost" >> /etc/hosts
echo "::1   localhost" >> /etc/hosts
echo "127.0.1.1   archlinux.localdomain   archlinux" >> /etc/hosts
mkinitcpio -P
(
echo 1234;
echo 1234;
) | passwd
pacman -Syy --noconfirm efibootmgr
EOF
