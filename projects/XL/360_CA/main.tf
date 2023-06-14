resource "random_string" "rand_str" {
  length  = 7
  special = false
}

resource "random_string" "rds_password_str" {
  length  = 10
  special = true
}

module "ec2_tableau" {
  depends_on = [
    data.aws_subnet.list_of_private_subnet,
    module.sg_tableau,
    # aws_key_pair.xl_360_CA_keypair
  ]

  source = "./modules/aws_instance/tableau"

  # az_list = [data.aws_availability_zones.list_of_az.names[0]]

  instance_count    = local.tableau_instance_count
  instance_type     = local.tableau_instance_type
  instance_image_id = local.tableau_image_id

  instance_subnet_ids = values(local.private_subnets_info)
  # instance_subnet_ids         = [values(local.private_subnets_info)[0]]
  instance_security_group_ids = [module.sg_tableau.security_group_id]

  is_associate_public_ip_address = !local.is_associate_public_ip_address

  ## key pair configuration
  instance_key_name = local.key_name

  ## root volume configuration
  root_volume_size              = local.root_volume_size
  root_volume_type              = local.root_volume_type
  root_is_encrypted             = local.root_is_encrypted
  root_is_delete_on_termination = local.root_is_delete_on_termination

  ## ebs volume configuration
  ebs1_device_name              = local.tableau_ebs1_device_name
  ebs1_volume_size              = local.tableau_ebs1_volume_size
  ebs1_volume_type              = local.tableau_ebs1_volume_type
  ebs1_is_encrypted             = local.tableau_ebs1_is_encrypted
  ebs1_is_delete_on_termination = local.tableau_ebs1_is_delete_on_termination

  instance_user_data = local.tableau_instance_user_data

  instance_tags = {
    Name          = format("%s-%s-Tableau-%s-ec2", local.project_name, local.environment, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
    map-migrated  = local.map-migrated
  }
}

module "ec2_collibra_dic" {
  depends_on = [
    data.aws_subnet.list_of_private_subnet,
    module.sg_collibra,
    # aws_key_pair.xl_360_CA_keypair
  ]

  source = "./modules/aws_instance/collibra-dic"

  # az_list = [data.aws_availability_zones.list_of_az.names[0]]

  instance_count    = local.collibra_instance_count
  instance_type     = local.collibra_dic_instance_type
  instance_image_id = local.collibra_image_id

  # instance_subnet_ids       = values(local.private_subnets_info)
  instance_subnet_ids         = [values(local.private_subnets_info)[0]]
  instance_security_group_ids = [module.sg_collibra.security_group_id]

  is_associate_public_ip_address = !local.is_associate_public_ip_address

  ## key pair configuration
  instance_key_name = local.key_name

  ## root volume configuration
  root_volume_size              = local.root_volume_size
  root_volume_type              = local.root_volume_type
  root_is_encrypted             = local.root_is_encrypted
  root_is_delete_on_termination = local.root_is_delete_on_termination

  ## ebs volume configuration
  ebs1_device_name              = local.collibra_ebs1_device_name
  ebs1_volume_size              = local.collibra_ebs1_volume_size
  ebs1_volume_type              = local.collibra_ebs1_volume_type
  ebs1_is_encrypted             = local.collibra_ebs1_is_encrypted
  ebs1_is_delete_on_termination = local.collibra_ebs1_is_delete_on_termination

  ebs2_device_name              = local.collibra_ebs2_device_name
  ebs2_volume_size              = local.collibra_ebs2_volume_size
  ebs2_volume_type              = local.collibra_ebs2_volume_type
  ebs2_is_encrypted             = local.collibra_ebs2_is_encrypted
  ebs2_is_delete_on_termination = local.collibra_ebs2_is_delete_on_termination


  instance_user_data = local.collibra_dic_instance_user_data

  instance_tags = {
    Name          = format("%s-%s-Collibra-DIC-%s-ec2", local.project_name, local.environment, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
    map-migrated  = local.map-migrated
  }
}

module "ec2_collibra_dq" {
  depends_on = [
    data.aws_subnet.list_of_private_subnet,
    module.sg_collibra,
    # aws_key_pair.xl_360_CA_keypair
  ]

  source = "./modules/aws_instance/collibra-dq"

  # az_list = [data.aws_availability_zones.list_of_az.names[0]]

  instance_count    = local.collibra_instance_count
  instance_type     = local.collibra_dq_instance_type
  instance_image_id = local.collibra_image_id

  # instance_subnet_ids       = values(local.private_subnets_info)
  instance_subnet_ids         = [values(local.private_subnets_info)[0]]
  instance_security_group_ids = [module.sg_collibra.security_group_id]

  is_associate_public_ip_address = !local.is_associate_public_ip_address

  ## key pair configuration
  instance_key_name = local.key_name

  ## root volume configuration
  root_volume_size              = local.root_volume_size
  root_volume_type              = local.root_volume_type
  root_is_encrypted             = local.root_is_encrypted
  root_is_delete_on_termination = local.root_is_delete_on_termination

  instance_user_data = local.collibra_dq_instance_user_data

  instance_tags = {
    Name          = format("%s-%s-Collibra-DQ-%s-ec2", local.project_name, local.environment, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
    map-migrated  = local.map-migrated
  }
}