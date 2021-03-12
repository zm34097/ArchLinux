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
