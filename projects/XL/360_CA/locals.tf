locals {
  generated_str              = random_string.rand_str.result
  rds_instance_name_str      = random_string.rds_instance_name_str.result
  rds_password_generated_str = random_string.rds_password_str.result


  access_key = var.access_key
  secret_key = var.secret_key
  token      = var.token


  ## vpc variable declaration
  vpc_id   = var.vpc_id
  vpc_cidr = data.aws_vpc.active_vpc.cidr_block


  public_subnets_cidr  = sort([for subnet in data.aws_subnet.list_of_public_subnet : subnet.cidr_block])
  private_subnets_cidr = sort([for subnet in data.aws_subnet.list_of_private_subnet : subnet.cidr_block])

  public_subnets_info  = { for k, v in data.aws_subnet.list_of_public_subnet : v.cidr_block => k }
  private_subnets_info = { for k, v in data.aws_subnet.list_of_private_subnet : v.cidr_block => k }


  ## aws instance variable declaration
  # tableau_instance_count = var.tableau_instance_count
  tableau_instance_count         = length(data.aws_subnet.list_of_private_subnet)
  tableau_instance_type          = var.tableau_instance_type
  tableau_image_id               = data.aws_ami.ubuntu-20_04.id
  tableau_instance_user_data     = data.template_file.tableau_init.rendered
  is_associate_public_ip_address = var.is_associate_public_ip_address

  collibra_instance_count         = var.collibra_instance_count
  collibra_dic_instance_type      = var.collibra_dic_instance_type
  collibra_dq_instance_type       = var.collibra_dq_instance_type
  collibra_image_id               = data.aws_ami.rhel-8.id
  collibra_dic_instance_user_data = data.template_file.collibra_dic_init.rendered
  collibra_dq_instance_user_data  = data.template_file.collibra_dq_init.rendered


  ## retrieve existing tableau instance for modification
  list_of_existing_tableau_instance_id = data.aws_instances.existing_tableau_instances.ids

  ## retrieve existing collibra instance for modification
  list_of_existing_collibra_instance_id = data.aws_instances.existing_collibra_instances.ids

  bastion_image_id = data.aws_ami.ubuntu-20_04.id

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

  tableau_ebs1_device_name              = var.tableau_ebs1_device_name
  tableau_ebs1_volume_size              = var.tableau_ebs1_volume_size
  tableau_ebs1_volume_type              = var.tableau_ebs1_volume_type
  tableau_ebs1_is_encrypted             = var.tableau_ebs1_is_encrypted
  tableau_ebs1_is_delete_on_termination = var.tableau_ebs1_is_delete_on_termination

  collibra_ebs1_device_name              = var.collibra_ebs1_device_name
  collibra_ebs1_volume_size              = var.collibra_ebs1_volume_size
  collibra_ebs1_volume_type              = var.collibra_ebs1_volume_type
  collibra_ebs1_is_encrypted             = var.collibra_ebs1_is_encrypted
  collibra_ebs1_is_delete_on_termination = var.collibra_ebs1_is_delete_on_termination

  collibra_ebs2_device_name              = var.collibra_ebs2_device_name
  collibra_ebs2_volume_size              = var.collibra_ebs2_volume_size
  collibra_ebs2_volume_type              = var.collibra_ebs2_volume_type
  collibra_ebs2_is_encrypted             = var.collibra_ebs2_is_encrypted
  collibra_ebs2_is_delete_on_termination = var.collibra_ebs2_is_delete_on_termination

  ## security group module variable declaration
  sg_module_ssh        = var.sg_module_ssh
  sg_module_http       = var.sg_module_http
  sg_module_https      = var.sg_module_https
  sg_module_postgresql = var.sg_module_postgresql

  ## tagging variable declaration
  created_by    = var.created_by
  generated_via = var.generated_via
  environment   = var.environment
  project_name  = var.project_name
  map-migrated  = var.map-migrated

  ## postgresql declaration
  rds_collibra_dq_username = var.rds_collibra_dq_username

}
