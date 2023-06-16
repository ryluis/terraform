resource "aws_db_subnet_group" "collibra_dq_subnet_group" {
  name       = "collibra_dq_subnet_group"
  subnet_ids = values(local.private_subnets_info)

  tags = {
    Name          = format("%s-%s-collibra_dq_subnet_group-%s-ec2", local.project_name, local.environment, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
    map-migrated  = local.map-migrated
  }
}

resource "aws_db_parameter_group" "collibra_dq_db_parameter_group" {
  name   = "collibra-dq-db-parameter-group"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "collibra_dq_rds_instance" {
  depends_on = [
    aws_db_subnet_group.collibra_dq_subnet_group,
    aws_db_parameter_group.collibra_dq_db_parameter_group,
    module.sg_rds_collibra_dq
  ]

  identifier                  = format("%s-%s-collibra-dq-%s-rds", local.project_name, local.environment, local.rds_instance_name_str)
  instance_class              = "db.m5.xlarge"
  allocated_storage           = 100
  max_allocated_storage       = 1000
  engine                      = "postgres"
  engine_version              = "14.7"
  username                    = "xl_dba"
  manage_master_user_password = true
  # password                  = local.rds_password_generated_str
  db_name                   = "collibra_dq"
  db_subnet_group_name      = aws_db_subnet_group.collibra_dq_subnet_group.name
  vpc_security_group_ids    = [module.sg_rds_collibra_dq.security_group_id]
  parameter_group_name      = aws_db_parameter_group.collibra_dq_db_parameter_group.name
  publicly_accessible       = false
  skip_final_snapshot       = false
  final_snapshot_identifier = format("%s-%s-collibra-dq-%s-rds-snapshot", local.project_name, local.environment, local.rds_instance_name_str)

  tags = {
    Name          = format("%s-%s-collibra-dq-%s-rds", local.project_name, local.environment, local.rds_instance_name_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
    map-migrated  = local.map-migrated

  }
}
