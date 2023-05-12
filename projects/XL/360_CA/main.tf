provider "aws" {
  region = var.aws_region

  access_key = var.access_key
  secret_key = var.secret_key
  token      = var.token
}

resource "random_string" "rand_str" {
  length  = 7
  special = false
}

module "sg_01" {
  depends_on = [
    data.aws_subnet.list_of_private_subnet,
    data.aws_subnet.list_of_public_subnet
  ]

  # source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  source = "terraform-aws-modules/security-group/aws"

  name        = format("%s-%s-%s-sg_01", local.environment, local.project_name, local.generated_str)
  description = "Security group for allowing ssh access from private subnet"
  vpc_id      = local.vpc_id

  ingress_cidr_blocks = sort(concat(local.public_subnets_cidr, local.private_subnets_cidr))


  ## using predefined rule declaration
  ingress_rules = [
    local.sg_module_ssh
  ]

  ingress_with_self = [{
    rule = "all-all"
  }]

  # egress_rules       = ["all-all"]
  # egress_cidr_blocks = ["0.0.0.0/0"]

  egress_with_cidr_blocks = [
    {
      from_port  = 0
      to_port    = 65535
      protocol   = "ALL"
      cidr_block = "0.0.0.0/0"
    }
  ]

  tags = {
    Name          = format("%s-%s-%s-sg_01", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

module "sg_02" {
  source = "terraform-aws-modules/security-group/aws"

  name        = format("%s-%s-%s-sg_02", local.environment, local.project_name, local.generated_str)
  description = "Security group for allowing ssh access from internet"
  vpc_id      = local.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]

  ## using predefined rule declaration
  ingress_rules = [
    local.sg_module_ssh
  ]

  ingress_with_self = [{
    rule = "all-all"
  }]

  # egress_rules       = ["all-all"]
  # egress_cidr_blocks = ["0.0.0.0/0"]

  egress_with_cidr_blocks = [
    {
      from_port  = 0
      to_port    = 65535
      protocol   = "ALL"
      cidr_block = "0.0.0.0/0"
    }
  ]

  tags = {
    Name          = format("%s-%s-%s-sg_02", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

module "ec2_tableau" {
  depends_on = [
    data.aws_subnet.list_of_private_subnet,
    module.sg_01,
    # aws_key_pair.xl_360_CA_keypair
  ]

  source = "./modules/aws_instance/tableau"

  # az_list = [data.aws_availability_zones.list_of_az.names[0]]

  instance_count    = local.tableau_instance_count
  instance_type     = local.tableau_instance_type
  instance_image_id = local.tableau_image_id

  # instance_subnet_ids       = values(local.private_subnets_info)
  instance_subnet_ids         = [values(local.private_subnets_info)[0]]
  instance_security_group_ids = [module.sg_01.security_group_id]

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

module "ec2_collibra" {
  depends_on = [
    data.aws_subnet.list_of_private_subnet,
    module.sg_01,
    # aws_key_pair.xl_360_CA_keypair
  ]

  source = "./modules/aws_instance/collibra"

  # az_list = [data.aws_availability_zones.list_of_az.names[0]]

  instance_count    = local.collibra_instance_count
  instance_type     = local.collibra_instance_type
  instance_image_id = local.collibra_image_id

  # instance_subnet_ids       = values(local.private_subnets_info)
  instance_subnet_ids         = [values(local.private_subnets_info)[0]]
  instance_security_group_ids = [module.sg_01.security_group_id]

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


  instance_user_data = local.collibra_instance_user_data

  instance_tags = {
    Name          = format("%s-%s-Collibra-%s-ec2", local.project_name, local.environment, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
    map-migrated  = local.map-migrated
  }
}


## run below resource to controll the state of ec2 instance
resource "aws_ec2_instance_state" "instance_state_controller" {
  count = length(local.list_of_existing_tableau_instance_id)

  instance_id = local.list_of_existing_tableau_instance_id[count.index]

  state = "stopped"
  # state = "running"
}
