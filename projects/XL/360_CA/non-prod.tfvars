# AWS authentication configuration
aws_profile                  = "lti-360"
aws_region                   = "ap-southeast-3"
aws_shared_credentials_files = ["/home/arry/.aws/credentials"]
aws_shared_config_files      = ["/home/arry/.aws/config"]


# AWS environment configuration

## VPC configuration
vpc_id = ["vpc-0e480bbc417a4e062"]



instance_user_data = data.template_file.tableau_init.rendered

tableau_instance_count = 1
# tableau_instance_type  = "m5.4xlarge"
tableau_instance_type = "t3.micro"


# collibra_intance_count = 1
# collibra_instance_type = "m5.4xlarge"


is_associate_public_ip_address = true


## root volume configuration
# volume_size              = 1000
root_volume_size              = 50
root_volume_type              = "gp3"
root_is_encrypted             = false
root_is_delete_on_termination = true

# ebs volume configuration
ebs1_device_name              = "/dev/xvda"
ebs1_volume_size              = 1000
ebs1_volume_type              = "gp3"
ebs1_is_encrypted             = true
ebs1_is_delete_on_termination = false


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
