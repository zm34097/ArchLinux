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
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
