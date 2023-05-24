module "sg_tableau" {
  depends_on = [
    data.aws_subnet.list_of_private_subnet,
    data.aws_subnet.list_of_public_subnet
  ]

  # source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  source = "terraform-aws-modules/security-group/aws"

  name        = format("%s-%s-%s-sg_tableau", local.environment, local.project_name, local.generated_str)
  description = "Security group for tableau instances"
  vpc_id      = local.vpc_id

  # ingress_cidr_blocks = sort(concat(local.public_subnets_cidr, local.private_subnets_cidr))
  ingress_cidr_blocks = [local.vpc_cidr]


  ## using predefined rule declaration
  ingress_with_self = [{
    rule = "all-all"
  }]

  ingress_rules = [
    local.sg_module_ssh,
    local.sg_module_http,
    local.sg_module_https
  ]

  ingress_with_cidr_blocks = [
    {
      from_port   = 8850
      to_port     = 8850
      protocol    = "tcp"
      description = "Tableau - TSM Access"
      cidr_blocks = local.vpc_cidr
    },
    {
      from_port   = 8000
      to_port     = 9000
      protocol    = "tcp"
      description = "Tableau - dynamic mapping"
      cidr_blocks = local.vpc_cidr
    },
    {
      from_port   = 8060
      to_port     = 8061
      protocol    = "tcp"
      description = "Tableau - Postgresql"
      cidr_blocks = local.vpc_cidr
    },
    {
      from_port   = 27000
      to_port     = 27009
      protocol    = "tcp"
      description = "Tableau - License Service"
      cidr_blocks = local.vpc_cidr
    }
  ]

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
    Name          = format("%s-%s-%s-sg_tableau", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

module "sg_collibra" {
  depends_on = [
    data.aws_subnet.list_of_private_subnet,
    data.aws_subnet.list_of_public_subnet
  ]

  source = "terraform-aws-modules/security-group/aws"

  name        = format("%s-%s-%s-sg_collibra", local.environment, local.project_name, local.generated_str)
  description = "Security group for collibra instance"
  vpc_id      = local.vpc_id

  # ingress_cidr_blocks = sort(concat(local.public_subnets_cidr, local.private_subnets_cidr))
  ingress_cidr_blocks = [local.vpc_cidr]


  ## using predefined rule declaration
  ingress_with_self = [{
    rule = "all-all"
  }]

  ingress_rules = [
    local.sg_module_ssh
  ]

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
    Name          = format("%s-%s-%s-sg_collibra", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

module "sg_public_access" {
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

module "sg_tableau_lb" {
  depends_on = [
    data.aws_subnet.list_of_private_subnet
  ]

  # source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  source = "terraform-aws-modules/security-group/aws"

  name        = format("%s-%s-%s-sg_tableau_lb", local.environment, local.project_name, local.generated_str)
  description = "Security group for tableau load balance"
  vpc_id      = local.vpc_id

  # ingress_cidr_blocks = sort(concat(local.public_subnets_cidr, local.private_subnets_cidr))
  ingress_cidr_blocks = [local.vpc_cidr]


  ## using predefined rule declaration
  ingress_with_self = [{
    rule = "all-all"
  }]

  ingress_rules = [
    local.sg_module_http,
    local.sg_module_https
  ]


  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

  tags = {
    Name          = format("%s-%s-%s-sg_tableau_lb", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}