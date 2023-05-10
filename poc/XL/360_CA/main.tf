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
  cidr_block = local.vpc_cidr


  tags = {
    Name          = local.vpc_name,
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment
    project_name  = local.project_name
  }
}

resource "aws_eip" "nat_gw_eip" {
  count = length(data.aws_availability_zones.list_of_az.names)

  vpc = true

  tags = {
    Name          = format("%s-%s-eip-%s", local.project_name, local.environment, data.aws_availability_zones.list_of_az.names[count.index]),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

resource "aws_internet_gateway" "internet_gw" {
  depends_on = [aws_vpc.xl_vpc]

  vpc_id = aws_vpc.xl_vpc.id

  tags = {
    Name          = format("%s-%s-igw", local.project_name, local.environment),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

resource "aws_nat_gateway" "nat_gw" {
  depends_on = [
    aws_subnet.public_subnet,
    aws_eip.nat_gw_eip,
  ]

  count = length(data.aws_availability_zones.list_of_az.names)

  subnet_id     = aws_subnet.public_subnet[count.index].id
  allocation_id = aws_eip.nat_gw_eip[count.index].id

  tags = {
    Name          = format("%s-%s-nat_gw-%s", local.project_name, local.environment, data.aws_availability_zones.list_of_az.names[count.index]),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

resource "aws_route_table" "public_route_table" {
  depends_on = [
    aws_vpc.xl_vpc,
    aws_internet_gateway.internet_gw
  ]

  vpc_id = aws_vpc.xl_vpc.id

  tags = {
    Name          = format("%s-%s-public-RouteTable", local.project_name, local.environment),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

resource "aws_route_table" "nat_gw_route_table" {
  depends_on = [
    aws_vpc.xl_vpc,
    aws_nat_gateway.nat_gw
  ]

  count = length(aws_nat_gateway.nat_gw.*.id)

  vpc_id = aws_vpc.xl_vpc.id

  tags = {
    Name          = format("%s-%s-nat_gw-RouteTable", local.project_name, local.environment),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

resource "aws_route" "public_route" {
  depends_on = [aws_route_table.public_route_table]

  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gw.id
}

resource "aws_route" "nat_gw_route" {
  depends_on = [aws_route_table.nat_gw_route_table]

  count = length(data.aws_availability_zones.list_of_az.names)

  route_table_id         = aws_route_table.nat_gw_route_table[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_gw[count.index].id
}

resource "aws_subnet" "public_subnet" {
  depends_on = [aws_vpc.xl_vpc]

  ## subnet will be created acrosss all available AZ
  count = length(data.aws_availability_zones.list_of_az.names)

  vpc_id     = aws_vpc.xl_vpc.id
  cidr_block = local.public_subnets[count.index]

  availability_zone = data.aws_availability_zones.list_of_az.names[count.index]

  tags = {
    ## ap-southeast-3a, ap-southeast-3b, ap-southeast-3c

    Name          = format("%s-%s-public-Subnet-%s", local.project_name, local.environment, data.aws_availability_zones.list_of_az.names[count.index]),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

resource "aws_subnet" "private_subnet" {
  depends_on = [aws_vpc.xl_vpc]

  ## subnet will be created acrosss all available AZ
  count = length(data.aws_availability_zones.list_of_az.names)

  vpc_id     = aws_vpc.xl_vpc.id
  cidr_block = local.private_subnets[count.index]

  availability_zone = data.aws_availability_zones.list_of_az.names[count.index]

  tags = {
    ## ap-southeast-3a, ap-southeast-3b, ap-southeast-3c

    Name          = format("%s-%s-private-Subnet-%s", local.project_name, local.environment, data.aws_availability_zones.list_of_az.names[count.index]),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

resource "aws_subnet" "protected_subnet" {
  depends_on = [aws_vpc.xl_vpc]

  ## subnet will be created acrosss all available AZ
  count = length(data.aws_availability_zones.list_of_az.names)

  vpc_id     = aws_vpc.xl_vpc.id
  cidr_block = local.protected_subnets[count.index]

  availability_zone = data.aws_availability_zones.list_of_az.names[count.index]

  tags = {
    ## ap-southeast-3a, ap-southeast-3b, ap-southeast-3c

    Name          = format("%s-%s-protected-Subnet-%s", local.project_name, local.environment, data.aws_availability_zones.list_of_az.names[count.index]),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

resource "aws_route_table_association" "public_route_association" {
  depends_on = [
    aws_vpc.xl_vpc,
    aws_internet_gateway.internet_gw,
    aws_route_table.public_route_table,
    aws_subnet.public_subnet
  ]

  count = length(aws_subnet.public_subnet.*.id)

  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "nat_gw_route_association" {
  depends_on = [
    aws_vpc.xl_vpc,
    aws_nat_gateway.nat_gw,
    aws_route_table.nat_gw_route_table,
    aws_subnet.private_subnet
  ]

  count = length(data.aws_availability_zones.list_of_az.names)

  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.nat_gw_route_table[count.index].id
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
  depends_on = [
    aws_vpc.xl_vpc,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet
  ]

  # source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  source = "terraform-aws-modules/security-group/aws"

  name        = format("%s-%s-%s-sg_01", local.environment, local.project_name, local.generated_str)
  description = "Security group for allowing ssh access from private subnet"
  vpc_id      = aws_vpc.xl_vpc.id

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

module "sg_02" {
  depends_on = [aws_vpc.xl_vpc]

  # source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  source = "terraform-aws-modules/security-group/aws"

  name        = format("%s-%s-%s-sg_01", local.environment, local.project_name, local.generated_str)
  description = "Security group for allowing ssh access from internet"
  vpc_id      = aws_vpc.xl_vpc.id

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
    Name          = format("%s-%s-%s-sg_01", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

module "ec2_bastion" {
  depends_on = [
    aws_vpc.xl_vpc,
    aws_subnet.public_subnet,
    module.sg_02,
    aws_key_pair.xl_360_CA_keypair
  ]

  source = "./modules/aws_instance"

  az_list = [data.aws_availability_zones.list_of_az.names[0]]

  instance_type               = "t3.micro"
  instance_image_id           = local.bastion_image_id
  instance_subnet_ids         = [aws_subnet.public_subnet[0].id]
  instance_security_group_ids = [module.sg_02.security_group_id]

  is_associate_public_ip_address = local.is_associate_public_ip_address

  ## key pair configuration
  instance_key_name = local.key_name

  ## root volume configuration
  root_volume_size              = 20
  root_volume_type              = "gp3"
  root_is_encrypted             = false
  root_is_delete_on_termination = true

  instance_tags = {
    Name          = format("%s-%s-Bastion-%s-ec2", local.project_name, local.environment, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
    map-migrated  = local.map-migrated
  }
}

module "ec2_tableau" {
  depends_on = [
    aws_vpc.xl_vpc,
    aws_subnet.private_subnet,
    module.sg_01,
    aws_key_pair.xl_360_CA_keypair
  ]

  source = "./modules/aws_instance"

  # instance_count    = local.tableau_instance_count
  # az_list = data.aws_availability_zones.list_of_az.names
  az_list = [data.aws_availability_zones.list_of_az.names[0]]

  instance_type     = local.tableau_instance_type
  instance_image_id = local.tableau_image_id
  # instance_subnet_ids         = aws_subnet.public_subnet.*.id
  instance_subnet_ids         = [aws_subnet.private_subnet[0].id]
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
  ebs1_device_name              = local.ebs1_device_name
  ebs1_volume_size              = local.ebs1_volume_size
  ebs1_volume_type              = local.ebs1_volume_type
  ebs1_is_encrypted             = local.ebs1_is_encrypted
  ebs1_is_delete_on_termination = local.ebs1_is_delete_on_termination

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


output "template_file" {
  value = data.template_file.tableau_init
}
