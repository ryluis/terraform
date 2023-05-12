# module "ec2_bastion" {
#   depends_on = [
#     data.aws_subnet.list_of_public_subnet,
#     module.sg_02,
#   ]

#   source = "./modules/aws_instance/tableau"

#   az_list = [data.aws_availability_zones.list_of_az.names[0]]

#   instance_count              = 1
#   instance_type               = "t3.micro"
#   instance_image_id           = local.bastion_image_id
#   instance_subnet_ids         = [values(local.public_subnets_info)[0]]
#   instance_security_group_ids = [module.sg_02.security_group_id]

#   is_associate_public_ip_address = local.is_associate_public_ip_address

#   ## key pair configuration
#   instance_key_name = local.key_name

#   ## root volume configuration
#   root_volume_size              = 20
#   root_volume_type              = "gp3"
#   root_is_encrypted             = false
#   root_is_delete_on_termination = true

#   instance_tags = {
#     Name          = format("%s-%s-Bastion-%s-ec2", local.project_name, local.environment, local.generated_str),
#     created_by    = local.created_by,
#     generated_via = local.generated_via,
#     environment   = local.environment,
#     project_name  = local.project_name
#     map-migrated  = local.map-migrated
#   }
# }