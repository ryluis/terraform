# AWS authentication configuration
# aws_profile                  = "lti-360"
# aws_region                   = "ap-southeast-3"
# aws_shared_credentials_files = ["/home/arry/.aws/credentials"]
# aws_shared_config_files      = ["/home/arry/.aws/config"]


# AWS environment configuration

## VPC configuration

## LTI
# vpc_id = "vpc-04840b2bd106d70b4"

# access_key = "ASIA5YDLWVT3GTSCGR4Z"
# secret_key = ""
# token      = ""


## XL
## PROD
vpc_id = "vpc-06f101878c9551781"

access_key = ""
secret_key = ""
token      = ""




## EC instance configuration

## Tableau
# tableau_instance_count = 1
tableau_instance_type = "r5.4xlarge"


## Collibra
collibra_instance_count    = 1
collibra_dic_instance_type = "m5.4xlarge"
collibra_dq_instance_type  = "r5.4xlarge"

is_associate_public_ip_address = true

## root volume configuration
root_volume_size              = 100
root_volume_type              = "gp3"
root_is_encrypted             = false
root_is_delete_on_termination = true

# ebs volume configuration
tableau_ebs1_device_name              = "/dev/xvda"
tableau_ebs1_volume_size              = 1000
tableau_ebs1_volume_type              = "gp3"
tableau_ebs1_is_encrypted             = false
tableau_ebs1_is_delete_on_termination = false

collibra_ebs1_device_name              = "/dev/xvda"
collibra_ebs1_volume_size              = 100
collibra_ebs1_volume_type              = "gp3"
collibra_ebs1_is_encrypted             = false
collibra_ebs1_is_delete_on_termination = false

collibra_ebs2_device_name              = "/dev/xvdb"
collibra_ebs2_volume_size              = 500
collibra_ebs2_volume_type              = "gp3"
collibra_ebs2_is_encrypted             = false
collibra_ebs2_is_delete_on_termination = false


## rds configuration
rds_collibra_dq_username = "collibra"

## key pair configuration
keypair_dir   = "keypairs"
keypair_file  = "edm-c360.pem"
key_name      = "edm-c360"
key_algorithm = "RSA"
key_bit_size  = 4096

## security group module
sg_module_ssh        = "ssh-tcp"
sg_module_http       = "http-80-tcp"
sg_module_https      = "https-443-tcp"
sg_module_postgresql = "postgresql-tcp"

## tagging configuration
created_by    = "LTI"
generated_via = "terraform"
project_name  = "edm360ca"
environment   = "production"

## tag for XL Non-Prod EC2 & S3
map-migrated = "mig34463"
