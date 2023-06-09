data "aws_availability_zones" "list_of_az" {
  state = "available"
}

data "aws_ami" "ubuntu-20_04" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "rhel-8" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["RHEL-8.1*HVM-*Hourly*"]
    # values = ["RHEL-8.2*HVM-*Hourly*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}


data "template_file" "tableau_init" {
  template = file("${path.module}/templates/tableau-init.sh")

}

data "template_file" "collibra_dic_init" {
  template = file("${path.module}/templates/collibra-dic-init.sh")

}

data "template_file" "collibra_dq_init" {
  template = file("${path.module}/templates/collibra-dq-init.sh")

}

data "aws_key_pair" "existing_key_pair" {
  key_name           = var.key_name
  include_public_key = true
}

data "aws_vpc" "active_vpc" {
  id = local.vpc_id
}

data "aws_subnets" "public_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.active_vpc.id]
  }

  filter {
    name   = "tag:Name"
    values = ["edm360ca-nonprod-public*"]
  }
}

data "aws_subnets" "private_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.active_vpc.id]
  }

  filter {
    name   = "tag:Name"
    values = ["edm360ca-nonprod-private*"]
  }
}

data "aws_subnet" "list_of_public_subnet" {
  for_each = toset(data.aws_subnets.public_subnet.ids)
  id       = each.value
}

data "aws_subnet" "list_of_private_subnet" {
  for_each = toset(data.aws_subnets.private_subnet.ids)
  id       = each.value
}

data "aws_instances" "existing_tableau_instances" {

  filter {
    name   = "tag:Name"
    values = ["*Tableau*"]
  }

  instance_state_names = ["running", "stopped"]

}

data "aws_instances" "existing_collibra_instances" {

  filter {
    name   = "tag:Name"
    values = ["*Collibra*"]
  }

  instance_state_names = ["running", "stopped"]

}
