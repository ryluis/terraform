resource "aws_instance" "tableau_server" {
  count                  = length(var.az_list)
  ami                    = var.image_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[count.index]
  vpc_security_group_ids = var.security_group_ids

  associate_public_ip_address = var.is_associate_public_ip_address



  # root disk
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
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

  tags = var.tags

}
