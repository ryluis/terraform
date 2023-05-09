resource "aws_instance" "server" {
  count                  = length(var.az_list)
  ami                    = var.instance_image_id
  instance_type          = var.instance_type
  subnet_id              = var.instance_subnet_ids[count.index]
  vpc_security_group_ids = var.instance_security_group_ids

  ## key pair
  key_name = var.instance_key_name

  associate_public_ip_address = var.is_associate_public_ip_address

  # root disk
  root_block_device {
    volume_size           = var.instance_volume_size
    volume_type           = var.instance_volume_type
    encrypted             = var.is_encrypted
    delete_on_termination = var.is_delete_on_termination
  }

  # data disk
  # ebs_block_device {
  #   device_name           = "/dev/xvda"
  #   volume_size           = "50"
  #   volume_type           = "gp3"
  #   encrypted             = true
  #   delete_on_termination = false
  # }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install -y net-tools network-manager
    
    EOF

  tags = var.instance_tags

}
