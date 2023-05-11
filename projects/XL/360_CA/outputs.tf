# output "public_subnet_cidr_blocks" {
#   value = local.public_subnets_cidr
#   # value = data.aws_subnet.list_of_public_subnet
# }

# output "private_subnet_cidr_blocks" {
#   # value = local.private_subnets_cidr
#   value = data.aws_subnet.list_of_private_subnet
# }

# output "public_subnets_info" {
#   value = local.public_subnets_info
# }

# output "private_subnets_info" {
#   value = local.private_subnets_info
# }

output "test" {
  value = data.aws_key_pair.existing_key_pair
}

