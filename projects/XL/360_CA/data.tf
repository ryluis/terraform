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

data "template_file" "tableau_init" {
  template = file("${path.module}/templates/tableau-init.sh")

}

data "aws_subnets" "list_of_subnet" {
  filter {
    name   = "vpc-id"
    values = local.vpc_id
  }
}

data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.list_of_subnet.ids)
  id       = each.value
}

output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.subnet : s.cidr_block]
}
