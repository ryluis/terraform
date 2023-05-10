resource "aws_instance" "server" {
  # count                       = var.instance_count
  count                       = length(var.az_list)
  ami                         = var.instance_image_id
  instance_type               = var.instance_type
  subnet_id                   = var.instance_subnet_ids[count.index]
  vpc_security_group_ids      = var.instance_security_group_ids
  associate_public_ip_address = var.is_associate_public_ip_address

  ## key pair
  key_name = var.instance_key_name



  # root disk
  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    encrypted             = var.root_is_encrypted
    delete_on_termination = var.root_is_delete_on_termination
  }

  # data disk
  ebs_block_device {
    device_name           = var.ebs1_device_name
    volume_size           = var.ebs1_volume_size
    volume_type           = var.ebs1_volume_type
    encrypted             = var.ebs1_is_encrypted
    delete_on_termination = var.ebs1_is_delete_on_termination
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install -y net-tools network-manager
    
    EOF

  tags = var.instance_tags
}