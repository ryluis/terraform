# AWS authentication configuration
aws_profile                  = "lti-360"
aws_region                   = "ap-southeast-3"
aws_shared_credentials_files = ["/home/arry/.aws/credentials"]
aws_shared_config_files      = ["/home/arry/.aws/config"]


# AWS environment configuration
# instance_count = 3
instance_type = "m5.4xlarge"

## VPC configuration
vpc_cidr = "10.0.0.0/16"

# public_subnets = [
#   "10.0.1.0/24",
#   "10.0.2.0/24",
#   "10.0.3.0/24"
# ]
# private_subnets = [
#   "10.0.101.0/24",
#   "10.0.102.0/24",
#   "10.0.103.0/24"
# ]


is_associate_public_ip_address = true


## volume configuration
volume_size              = 1000
volume_type              = "gp3"
is_encrypted             = false
is_delete_on_termination = true



## tagging configuration
created_by    = "arry"
generated_via = "terraform"
project_name  = "360-CA"
environment   = "dev"


## tag for XL Non-Prod EC2 & S3
#map-migrated = "mig34463"


## common configuration
is_enable = true