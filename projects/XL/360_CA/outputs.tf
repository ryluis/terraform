output "vpc" {
  description = "show result of created vpc"
  value       = aws_vpc.xl_vpc
}

output "public_subnet" {
  description = "show result of created public subnet"
  value       = aws_subnet.public_subnet
}
