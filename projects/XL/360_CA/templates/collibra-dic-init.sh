#!/bin/bash
sudo yum install -y vim bash-completion container-selinux selinux-policy-base
sudo yum install -y https://rpm.rancher.io/k3s/stable/common/centos/7/noarch/k3s-selinux-0.2-1.el7_8.noarch.rpm

## configure 1st partition for /storage
sudo bash -c "mkdir -p /storage"
sudo bash -c "mkfs.xfs /dev/nvme1n1"
sudo bash -c "mount /dev/nvme1n1 /storage"
sudo bash -c "echo '/dev/nvme1n1 /storage xfs defaults 0 0' >> /etc/fstab"

## configure 2nd partition for /var/lib/rancher/k3s
sudo bash -c "mkdir -p /var/lib/rancher/k3s"
sudo bash -c "mkdir -p /var/lib/kubelet"
sudo bash -c "mkfs.xfs /dev/nvme2n1"
sudo bash -c "mount /dev/nvme2n1 /var/lib/rancher/k3s"
sudo bash -c "echo '/dev/nvme2n1 /var/lib/rancher/k3s xfs defaults 0 0' >> /etc/fstab"


## create user 
sudo bash -c "useradd -m -s /bin/bash collibra"

## modify sudoers
sudo bash -c "echo 'collibra ALL=(ALL:ALL) ALL' > /etc/sudoers.d/custom"

## modify sshd_config
sudo bash -c "sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config"
sudo bash -c "systemctl restart sshd"

## modify timezone
sudo bash -c "timedatectl set-timezone Asia/Jakarta"


