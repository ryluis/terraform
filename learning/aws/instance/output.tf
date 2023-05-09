output "instance_id" {
  value = aws_instance.dummy-instance.id
}

output "private_ip" {
  value = aws_instance.dummy-instance.private_ip
}

output "public_ip" {
  value = aws_instance.dummy-instance.public_ip
}