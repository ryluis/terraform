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

data "aws_availability_zones" "list_of_az" {
  state = "available"
}

data "aws_ami" "ubuntu-20_04" {
  most_recent = true
  owners      = ["amazon"]

  # filter {
  #   name   = "image_id"
  #   values = local.image_id
  # }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


locals {
  created_by    = var.created_by
  generated_via = var.generated_via
  environment   = var.environment
  project_name  = var.project_name

  generated_str = random_string.rand_str.result
  instance_type = var.instance_type
  image_id      = data.aws_ami.ubuntu-20_04.id

  volume_size                    = var.volume_size
  volume_type                    = var.volume_type
  is_encrypted                   = var.is_encrypted
  is_delete_on_termination       = var.is_delete_on_termination
  is_associate_public_ip_address = var.is_associate_public_ip_address
}

resource "aws_vpc" "tableau_vpc" {
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
  depends_on = [aws_vpc.tableau_vpc]

  ## subnet will be created acrosss all available AZ
  count = length(data.aws_availability_zones.list_of_az.names)

  vpc_id            = aws_vpc.tableau_vpc.id
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



module "app_security_group" {
  depends_on = [aws_vpc.tableau_vpc]



  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 4.0"

  name        = format("sg_ssh-%s-%s-%s", local.environment, local.project_name, local.generated_str)
  description = "Security group for allowing ssh access"
  vpc_id      = aws_vpc.tableau_vpc.id

  ingress_cidr_blocks = aws_subnet.public_subnet.*.cidr_block

  tags = {
    Name          = format("sg_%s-%s-%s", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

resource "aws_ec2_instance_state" "dummy-instance" {
  instance_id = module.ec2_tableau.id
  state       = "stopped"
  # state = "running"
}

module "ec2_tableau" {
  depends_on = [
    aws_vpc.tableau_vpc,
    aws_subnet.public_subnet,
    module.app_security_group
  ]
  source = "./modules/aws_instance/tableau"

  az_list            = data.aws_availability_zones.list_of_az.names
  instance_type      = local.instance_type
  image_id           = local.image_id
  subnet_ids         = aws_subnet.public_subnet.*.id
  security_group_ids = [module.app_security_group.security_group_id]

  is_associate_public_ip_address = local.is_associate_public_ip_address

  ## root volume configuration
  volume_size              = local.volume_size
  volume_type              = local.volume_type
  is_encrypted             = local.is_encrypted
  is_delete_on_termination = local.is_delete_on_termination


  tags = {
    Name          = format("ec2_%s-%s-%s", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}






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



