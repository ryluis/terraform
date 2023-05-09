locals {
  generated_str = random_string.rand_str.result

  ## vpc variable declaration
  vpc_name          = var.vpc_name
  vpc_cidr          = var.vpc_cidr
  public_subnets    = var.public_subnets
  private_subnets   = var.private_subnets
  protected_subnets = var.protected_subnets

  ## aws instance variable declaration
  tableau_instance_count         = var.tableau_instance_count
  tableau_instance_type          = var.tableau_instance_type
  tableau_image_id               = data.aws_ami.ubuntu-20_04.id
  is_associate_public_ip_address = var.is_associate_public_ip_address

  ## keypair variable declaration
  key_name      = var.key_name
  key_algorithm = var.key_algorithm
  keypair_dir   = var.keypair_dir
  keypair_file  = var.keypair_file
  key_bit_size  = var.key_bit_size

  ## storage variable declaration
  volume_size              = var.volume_size
  volume_type              = var.volume_type
  is_encrypted             = var.is_encrypted
  is_delete_on_termination = var.is_delete_on_termination

  ## security group module variable declaration
  sg_module_ssh = var.sg_module_ssh

  ## tagging variable declaration
  created_by    = var.created_by
  generated_via = var.generated_via
  environment   = var.environment
  project_name  = var.project_name
  map-migrated  = var.map-migrated
}
