## enable below resource to generate Key pair
# resource "tls_private_key" "tls_key" {
#   algorithm = local.key_algorithm
#   rsa_bits  = local.key_bit_size
# }

# resource "aws_key_pair" "xl_360_CA_keypair" {
#   depends_on = [tls_private_key.tls_key]

#   key_name   = local.key_name
#   public_key = tls_private_key.tls_key.public_key_openssh

#   # tags = {}
# }

# resource "local_file" "xl_360_ca_key" {
#   depends_on = [
#     tls_private_key.tls_key,
#     aws_key_pair.xl_360_CA_keypair
#   ]

#   content  = tls_private_key.tls_key.private_key_pem
#   filename = "${path.module}/${local.keypair_dir}/${local.keypair_file}"
# }