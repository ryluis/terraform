resource "aws_instance" "server" {
  count                       = var.instance_count
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

  user_data = var.instance_user_data

  tags = var.instance_tags
}
