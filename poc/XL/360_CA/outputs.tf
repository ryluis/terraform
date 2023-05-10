output "vpc" {
  description = "show result of created vpc"
  value       = aws_vpc.xl_vpc
}

output "public_subnet" {
  description = "show result of created public subnet"
  value       = aws_subnet.public_subnet
}

# output "security_group" {
#   description = "show result of created security group"
#   value       = module.app_security_group
# }



## below are the example about how to read from existing AWS environment

data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = ["vpc-0e480bbc417a4e062"]
  }
}

data "aws_subnet" "test" {
  for_each = toset(data.aws_subnets.example.ids)
  id       = each.value
}

output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.test : s.cidr_block]
}