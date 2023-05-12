#!/bin/bash
sudo yum install -y container-selinux selinux-policy-base
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