#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y net-tools network-manager gdebi-core firewalld

## configure firewalld
sudo bash -c "systemctl enable firewalld"
sudo bash -c "systemctl restart firewalld"
sudo bash -c "firewall-cmd --permanent --add-service=http --add-service=https"
sudo bash -c "firewall-cmd --permanent --add-port={8850,8060-8061,8000-9000,27000-27009}/tcp"
sudo bash -c "firewall-cmd --reload"


## create user 
sudo bash -c "useradd -m -s /bin/bash tableau"

## modify sudoers
sudo bash -c "echo 'tableau ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/custom"

## modify timezone
sudo bash -c "timedatectl set-timezone Asia/Jakarta"

