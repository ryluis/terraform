output "vpc" {
  description = "show result of created vpc"
  value       = aws_vpc.xl_vpc
}

output "public_subnet" {
  description = "show result of created public subnet"
  value       = aws_subnet.public_subnet
}

output "private_subnet" {
  description = "show result of created public subnet"
  value       = aws_subnet.private_subnet
}

# output "security_group" {
#   description = "show result of created security group"
#   value       = module.app_security_group
# }
