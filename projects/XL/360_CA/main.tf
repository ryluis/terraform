provider "aws" {
  region = var.aws_region

  # shared_config_files      = var.aws_shared_config_files
  # shared_credentials_files = var.aws_shared_credentials_files
  # profile                  = var.aws_profile

  ## LTI 
  # access_key = "ASIA5YDLWVT3EL4DIXPK"
  # secret_key = "AXFscNfsqpnGbY7K2dZWck6pk877CPYlOVCUJ4K9"
  # token      = "IQoJb3JpZ2luX2VjEIj//////////wEaDmFwLXNvdXRoZWFzdC0xIkgwRgIhAKb89JYKBDFCIxDaPoRdUiuV+VwBTWzVeUjeESuCUcn1AiEAp0dFHp4ttev39tlb5oZKn8c8RyIY+muRfAL9WvKx1okq9QIIof//////////ARAAGgw5NDUxMTg2ODY0NTQiDG25Tf0A4kGD0NaIYirJAuHq6pw1sI2Chd+aQssVg1IjIlIZ4f722+M9QDT2rcjSjryE4tFFaiNcKwwRtlFl+2EGzZCKf5WeZBdL8ZyT3wCaYxtglbCmDAenmovXvf9TWFPt1fbIegdZy7cGOpvzaGON1hiapuFg98LYNARAA+SkFMLnmNqXmPr9I7kskW1QjuLEMtpR/L220uKpX5cT3WrzEhWGKpJmMsmA6CeKc2Q5RmulLjyInfgSIP3shsWvoaXJn9qoLUfuIbxynxI4fj6u5mOd1Zy7r5fn0UygYAv4Sjn8RKYJALBd2ipdl1RXqbInVOOpRp5tJG38HBa7CoDu14GQ7hz6GRJoiiYfvqzTty5yTg0jgrW1cCdqPDfNS46eR91eZnxzAZi8H/9V2dFhfmQ/gD9RNcV1mk04J68JVoQ29QLz3VFxNSQTkQnBvgux+HRM2xw6MMy78qIGOqYBEGF0DIgXvBCFuQ6JGByhTB4e6piS7xFB4eKD8YbdUi2uvakpJ8bkXq8OAiJTf6QGLNDWfFcuhS/CPbNrovOtDKd9Gf23u3+HSTtS7OBAvpXhR0qbiz7RONtyFCVxQAwrmtL4+by/76kE045y+05XBn5VdPpkiEInvt0mYGDdduEPEked/KaE/H5O13U24WcUdfWHq9jXMqlerbs4LreYtGpN6ct9+g=="

  ## XL NonProd
  access_key = "ASIA2SFV734CY6ETGRGV"
  secret_key = "WhnOcD84l6yytUsnwtzCNt5jWwi1hFzE2MkCfM9Q"
  token      = "IQoJb3JpZ2luX2VjEIj//////////wEaDmFwLXNvdXRoZWFzdC0xIkcwRQIgBbhsiXMJgM6Grijq+ulKngWL7t/P2cwb4/EDKP77mLECIQCa5L8g23nsOfHUChoiazBMRqLPEO35xuJcvTvfj0eO4SqRAwih//////////8BEAAaDDcyNjIzMTE0NjI0NSIMb62HFlGAHMdG3ItEKuUCLBwNd/Iwd0Lcn6MVM83OQoXvWhsJt3dSO1AskVH2xwOB+pzhig0FO2b9ly6ocmHBN+o9FIuc3hHeDWR27a6HuK8uCbVTs8+XJCGgoo27evGh3jkcE6TOJdEZ7y0zvYk61QnrtXlqO+nc56NCapTAUqG3D2KpoTNwF1WRpsi3z1m6o3zL1oB7C0BerptL8My5DbWz392BUolEQhbg/9T31dxHQV5CwmN2ILnsiqS/N4aZ5Ae835PiynHmiGgkMyvJp3jb3odDbma4SbQIgepQeS0C1jOIq9XFKXmBWpe+A1y+5TcfclXEtX9PID1/7BEGAg1UysX0iFnyYrhLPplvI4GWJ2mcBER4EZmUcel4jnJZXIs0PwouJnij2tw0Zz9Pxp1S+T74u7Su+ehjEZKC/Ow1VyzB08hVS1nxy8HrOaAMMTMz69PB6KEK7k1/MhSWC+1/dAdGfpCEG+qvZYvzW7Awiv0GMLbE8qIGOqYBlRYVsJm4MFBq3uTiPr+wQKg1fpoQKbL+VDbvGpub6LeCuXZSu+Dsv3SsUzefYlWvzvZ2XyC3RMpcabIhgnDBAEey5eifui9GJSSyLknYtHmKYUAd8cvwyhNRNt2bJ096PfmSXBSizyBUaCjY9rtVGUyYF3I+0DL7lrMEZYfx/hei9MZSvGP/wDKVn7ogVendq3xSfI4TLcgcjZWG1GALR9p/eXzG+g=="

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

  source = "./modules/aws_instance"

  # az_list = [data.aws_availability_zones.list_of_az.names[0]]

  ## for nonprod, only need to create one instance
  instance_count = 1

  ## for prod, instance will be created as much as the private subnet size
  # instance_count = length(data.aws_subnet.list_of_private_subnet)

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



## run below resource to controll the state of ec2 instance
resource "aws_ec2_instance_state" "instance_state_controller" {
  count = length(local.list_of_existing_tableau_instance.ids)

  instance_id = local.list_of_existing_tableau_instance.ids[count.index]

  state = "stopped"
  # state = "running"
}
