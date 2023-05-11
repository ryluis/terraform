locals {
  generated_str = random_string.rand_str.result

  ## vpc variable declaration
  vpc_id = var.vpc_id

  ## aws instance variable declaration
  tableau_instance_count         = var.tableau_instance_count
  tableau_instance_type          = var.tableau_instance_type
  tableau_image_id               = data.aws_ami.ubuntu-20_04.id
  is_associate_public_ip_address = var.is_associate_public_ip_address
  tableau_instance_user_data     = data.template_file.tableau_init.rendered

  bastion_image_id               = data.aws_ami.ubuntu-20_04.id

  ## keypair variable declaration
  key_name      = var.key_name
  key_algorithm = var.key_algorithm
  keypair_dir   = var.keypair_dir
  keypair_file  = var.keypair_file
  key_bit_size  = var.key_bit_size

  ## storage variable declaration
  root_volume_size              = var.root_volume_size
  root_volume_type              = var.root_volume_type
  root_is_encrypted             = var.root_is_encrypted
  root_is_delete_on_termination = var.root_is_delete_on_termination

  ebs1_device_name              = var.ebs1_device_name
  ebs1_volume_size              = var.ebs1_volume_size
  ebs1_volume_type              = var.ebs1_volume_type
  ebs1_is_encrypted             = var.ebs1_is_encrypted
  ebs1_is_delete_on_termination = var.ebs1_is_delete_on_termination



  ## security group module variable declaration
  sg_module_ssh = var.sg_module_ssh

  ## tagging variable declaration
  created_by    = var.created_by
  generated_via = var.generated_via
  environment   = var.environment
  project_name  = var.project_name
  map-migrated  = var.map-migrated
}
