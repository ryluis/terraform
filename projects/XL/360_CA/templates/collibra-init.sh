#!/bin/bash

## configure 1st partition for /var
sudo bash -c "mkfs.xfs /dev/nvme2n1"
sudo bash -c "mount /dev/nvme2n1 /var"
sudo bash -c "echo '/dev/nvme2n1 /var xfs defaults 0 0' >> /etc/fstab"
sudo bash -c "mkdir -p /var/lib/rancher/k3s"
sudo bash -c "mkdir -p /var/lib/kubelet"
    
## configure 2nd partition for /storage
sudo bash -c "mkdir -p /storage"
sudo bash -c "mkfs.xfs /dev/nvme1n1"
sudo bash -c "mount /dev/nvme1n1 /storage"
sudo bash -c "echo '/dev/nvme1n1 /storage xfs defaults 0 0' >> /etc/fstab"
