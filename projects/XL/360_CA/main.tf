provider "aws" {
  region = var.aws_region

  shared_config_files      = var.aws_shared_config_files
  shared_credentials_files = var.aws_shared_credentials_files
  profile                  = var.aws_profile

}

resource "random_string" "rand_str" {
  length  = 7
  special = false
}

resource "tls_private_key" "tls_key" {
  algorithm = local.key_algorithm
  rsa_bits  = local.key_bit_size
}

resource "aws_key_pair" "xl_360_CA_keypair" {
  key_name   = local.key_name
  public_key = tls_private_key.tls_key.public_key_openssh
}

resource "local_file" "xl_360_ca_key" {
  content  = tls_private_key.tls_key.private_key_pem
  filename = "${path.module}/${local.keypair_dir}/${local.keypair_file}"
}

module "sg_01" {
  # depends_on = [

  # ]

  # source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  source = "terraform-aws-modules/security-group/aws"

  name        = format("%s-%s-%s-sg_01", local.environment, local.project_name, local.generated_str)
  description = "Security group for allowing ssh access from private subnet"
  vpc_id      = local.vpc_id

  ingress_cidr_blocks = concat(aws_subnet.private_subnet.*.cidr_block, aws_subnet.public_subnet.*.cidr_block)

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

# module "sg_02" {
#   depends_on = [aws_vpc.xl_vpc]

#   # source  = "terraform-aws-modules/security-group/aws//modules/ssh"
#   source = "terraform-aws-modules/security-group/aws"

#   name        = format("%s-%s-%s-sg_01", local.environment, local.project_name, local.generated_str)
#   description = "Security group for allowing ssh access from internet"
#   vpc_id      = aws_vpc.xl_vpc.id

#   ingress_cidr_blocks = ["0.0.0.0/0"]

#   ## using predefined rule declaration
#   ingress_rules = [
#     local.sg_module_ssh
#   ]

#   ingress_with_self = [{
#     rule = "all-all"
#   }]

#   # egress_rules       = ["all-all"]
#   # egress_cidr_blocks = ["0.0.0.0/0"]

#   egress_with_cidr_blocks = [
#     {
#       from_port  = 0
#       to_port    = 65535
#       protocol   = "ALL"
#       cidr_block = "0.0.0.0/0"
#     }
#   ]

#   tags = {
#     Name          = format("%s-%s-%s-sg_01", local.environment, local.project_name, local.generated_str),
#     created_by    = local.created_by,
#     generated_via = local.generated_via,
#     environment   = local.environment,
#     project_name  = local.project_name
#   }
# }

# module "ec2_tableau" {
#   depends_on = [
#     aws_vpc.xl_vpc,
#     aws_subnet.private_subnet,
#     module.sg_01,
#     aws_key_pair.xl_360_CA_keypair
#   ]

#   source = "./modules/aws_instance"

#   # instance_count    = local.tableau_instance_count

#   # az_list = data.aws_availability_zones.list_of_az.names
#   az_list = [data.aws_availability_zones.list_of_az.names[0]]

#   instance_type     = local.tableau_instance_type
#   instance_image_id = local.tableau_image_id
#   # instance_subnet_ids         = aws_subnet.private_subnet.*.id
#   instance_subnet_ids         = [aws_subnet.private_subnet[0].id]
#   instance_security_group_ids = [module.sg_01.security_group_id]

#   is_associate_public_ip_address = !local.is_associate_public_ip_address

#   ## key pair configuration
#   instance_key_name = local.key_name

#   ## root volume configuration
#   root_volume_size              = local.root_volume_size
#   root_volume_type              = local.root_volume_type
#   root_is_encrypted             = local.root_is_encrypted
#   root_is_delete_on_termination = local.root_is_delete_on_termination

#   ## ebs volume configuration
#   ebs1_device_name              = local.ebs1_device_name
#   ebs1_volume_size              = local.ebs1_volume_size
#   ebs1_volume_type              = local.ebs1_volume_type
#   ebs1_is_encrypted             = local.ebs1_is_encrypted
#   ebs1_is_delete_on_termination = local.ebs1_is_delete_on_termination

#   instance_user_data = local.tableau_instance_user_data

#   instance_tags = {
#     Name          = format("%s-%s-Tableau-%s-ec2", local.project_name, local.environment, local.generated_str),
#     created_by    = local.created_by,
#     generated_via = local.generated_via,
#     environment   = local.environment,
#     project_name  = local.project_name
#     map-migrated  = local.map-migrated
#   }
# }
