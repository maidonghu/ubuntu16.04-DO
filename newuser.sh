#!/bin/bash
su - mike
mkdir ~/.ssh
chmod 700 ~/.ssh
touch ./.ssh/authorized_keys
sudo cat ./.ssh/authorized_keys | tee -a /home/mike/.ssh/authorized_keys
su - mike
chmod 600 ~/.ssh/authorized_keys
echo export GOPATH=$HOME/gocode | sudo tee -a ./.profile
echo PATH=$PATH:$HOME/gocode/bin | sudo tee -a ./.profile
exit
