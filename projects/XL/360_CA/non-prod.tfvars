# AWS authentication configuration
# aws_profile                  = "lti-360"
# aws_region                   = "ap-southeast-3"
# aws_shared_credentials_files = ["/home/arry/.aws/credentials"]
# aws_shared_config_files      = ["/home/arry/.aws/config"]


# AWS environment configuration

## VPC configuration

## LTI
# vpc_id = "vpc-04840b2bd106d70b4"

# access_key = ""
# secret_key = ""
# token      = ""


## XL
## NonProd
vpc_id = "vpc-09a25a3c8b6353b7b"

access_key = ""
secret_key = ""
token      = ""




## EC instance configuration
tableau_instance_count = 1
# tableau_instance_count = length(data.aws_subnet.list_of_private_subnet)
tableau_instance_type = "m5.4xlarge"
# tableau_instance_type = "t3.micro"


collibra_instance_count = 1
collibra_instance_type  = "m5.4xlarge"



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



## key pair configuration
keypair_dir   = "keypairs"
keypair_file  = "xl_360_CA.pem"
key_name      = "xl_360_CA_keypair"
key_algorithm = "RSA"
key_bit_size  = 4096

## security group module
sg_module_ssh = "ssh-tcp"

## tagging configuration
created_by    = "LTI"
generated_via = "terraform"
project_name  = "edm360ca"
environment   = "nonprod"

## tag for XL Non-Prod EC2 & S3
map-migrated = "mig34463"
