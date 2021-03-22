#!/bin/bash

touch /etc/systemd/network/20-wired.network
echo "[Match]" >> /etc/systemd/network/20-wired.network 
echo "Name=enp0s3" >> /etc/systemd/network/20-wired.network
echo "" >> /etc/systemd/network/20-wired.network
echo "[Network]" >> /etc/systemd/network/20-wired.network
echo "DHCP=yes" >> /etc/systemd/network/20-wired.network
#echo "Address=10.1.10.9/24" >> /etc/systemd/network/20-wired.network
#echo "Gateway=10.1.10.1" >> /etc/systemd/network/20-wired.network
#echo "DNS=10.1.10.1" >> /etc/systemd/network/20-wired.network
systemctl restart systemd-networkd
systemctl enable systemd-resolved
systemctl start systemd-resolved
