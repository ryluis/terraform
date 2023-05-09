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

resource "aws_vpc" "xl_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name          = format("vpc_%s-%s-%s", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment
    project_name  = local.project_name
  }
}

resource "aws_subnet" "public_subnet" {
  depends_on = [aws_vpc.xl_vpc]

  ## subnet will be created acrosss all available AZ
  count = length(data.aws_availability_zones.list_of_az.names)

  vpc_id            = aws_vpc.xl_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, "8", count.index + 1)
  availability_zone = data.aws_availability_zones.list_of_az.names[count.index]

  tags = {
    ## ap-southeast-3a, ap-southeast-3b, ap-southeast-3c

    Name          = format("public_subnet_%s-%s-%s-%s", substr(data.aws_availability_zones.list_of_az.names[count.index], 13, 2), local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
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

module "app_security_group" {
  depends_on = [aws_vpc.xl_vpc]

  # source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  source = "terraform-aws-modules/security-group/aws"

  name        = format("sg_ssh-%s-%s-%s", local.environment, local.project_name, local.generated_str)
  description = "Security group for allowing ssh access"
  vpc_id      = aws_vpc.xl_vpc.id

  ingress_cidr_blocks = aws_subnet.public_subnet.*.cidr_block

  ## using predefined rule declaration
  ingress_rules = [
    local.sg_module_ssh
  ]

  ingress_with_self = [{
    rule = "all-all"
  }]

  ## using custom rule declaration
  # ingress_with_cidr_blocks = [
  #   {
  #     from_port  = 22
  #     to_port    = 22
  #     protocol   = "tcp"
  #     cidr_block = "0.0.0.0/0"
  #   }
  # ]

  # egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

  egress_with_cidr_blocks = [
    {
      from_port  = 0
      to_port    = 65535
      protocol   = "ALL"
      cidr_block = "0.0.0.0/0"
    }
  ]

  tags = {
    Name          = format("sg_%s-%s-%s", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

module "ec2_tableau" {
  depends_on = [
    aws_vpc.xl_vpc,
    aws_subnet.public_subnet,
    module.app_security_group,
    aws_key_pair.xl_360_CA_keypair
  ]

  source = "./modules/aws_instance"

  az_list                     = data.aws_availability_zones.list_of_az.names
  instance_type               = local.instance_type
  instance_image_id           = local.image_id
  instance_subnet_ids         = aws_subnet.public_subnet.*.id
  instance_security_group_ids = [module.app_security_group.security_group_id]

  is_associate_public_ip_address = local.is_associate_public_ip_address

  ## key pair configuration
  instance_key_name = local.key_name

  ## root volume configuration
  instance_volume_size     = local.volume_size
  instance_volume_type     = local.volume_type
  is_encrypted             = local.is_encrypted
  is_delete_on_termination = local.is_delete_on_termination


  instance_tags = {
    Name          = format("ec2_%s-%s-%s", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}



#### Getting the list of subnet ids created with for_each

# subnet_ids = [for k, v in aws_subnet.private : aws_subnet.private[k].id]












# output "path" {
#   value = path.module
# }

# output "list_of_ubuntu" {
#   value = data.aws_ami.ubuntu-20_04
# }

## vpc module can be used to define public subnet & private subnet explicitly

# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "3.19.0"

#   azs  = data.aws_availability_zones.list_of_az.names
#   cidr = var.vpc_cidr

#   public_subnets = var.public_subnets
#   public_subnets  = var.public_subnets

#   # enable_nat_gateway = var.is_enable

#   tags = {
#     "Name"         = format("vpc-%s-%s-%s", "${random_string.rand_str.result}", var.environment, var.project_name),
#     "created_by"   = var.created_by,
#     "created_via"  = var.created_via,
#     "environment"  = var.environment,
#     "project_name" = var.project_name,
#   }
# }
