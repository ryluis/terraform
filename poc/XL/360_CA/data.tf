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