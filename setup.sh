#!/bin/sh
passwd
apt update && apt upgrade -y
timedatectl set-timezone America/Vancouver
apt install ntp

