#!/bin/sh
read -s -p "Enter Root Password: "  pswd
echo -e '$pswd\n$pswd' | passwd
# passwd
apt update && apt upgrade -y
timedatectl set-timezone America/Vancouver
apt install ntp

