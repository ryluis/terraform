# AWS authentication configuration
# aws_profile                  = "lti-360"
# aws_region                   = "ap-southeast-3"
# aws_shared_credentials_files = ["/home/arry/.aws/credentials"]
# aws_shared_config_files      = ["/home/arry/.aws/config"]


# AWS environment configuration

## VPC configuration

## LTI
vpc_id = "vpc-04840b2bd106d70b4"

access_key = "ASIA5YDLWVT3GTSCGR4Z"
secret_key = "V3AqSfcT10hzyhMqMKy0AsWPM0x6dp1hk+ppS+vN"
token      = "IQoJb3JpZ2luX2VjELv//////////wEaDmFwLXNvdXRoZWFzdC0xIkcwRQIhAJwPlZruWX6c4xCeaPd4nVP0zSCg8wGuy/rg1vjF19gfAiAUK8TBJ5bWjMIm4YHNEATD+QishQAOctyO57o723he4Cr1Agjk//////////8BEAAaDDk0NTExODY4NjQ1NCIMgUXtUVdQ/U3Y9/VlKskCUFCPIog/riE51LwHwB4iGVcMj85AgYy4murJrcCUgxpig35diETIdTUg8dk/qyTNNj4203aA7ytZkfn2L4Ktw3LntAFKDLApYc032D1pkvmGuC5rzqiTj/T7VJursWNPwdcyCuwZUGLxR3yMBYBbmo5zRK7BLwXaScVg2Bbv0qa6mVxG6m4FpsJx63KA62paa3HRBcsFY6MhTLJCir5o5cp4on5DjZdQVd2kGP3K6VMRj7tKIr7nB6Oq82fVzXG8daMg+eGpkrE03IFgQR8yFK6dg5tmg/ujPMMv1XWvkLvZYM8h1TPh3Vy/ekc2RoEDPBoM0BbhUknPrafJqa0F+6npLE0MzQsTjSBIDN6pDlICOPBx03WUfovwGRAIU21CzCprn1p5VnVqfY31+8XwB74/5jPe8ITjOSaaK2jeMADrf7hnblralBYwq/q1owY6pwEpn2iMUMMenlZSMYY/BsPo36/LCjVfIM4v+sAMDXRbwIsqLPX8JLIRmMgp29lzJLDRgHyyQpyncisj3FKbK3SSMqSXSLZAzwZ2GaMGW036UeJGuuIANRiP0ovPlsckdAqkSCfuxxXI4DtjL5nNsk3k6DFDhpyU4ga2XMPERTCoDUP6I+zTnqPbBSgAR/W0ariO55q0rZSXtLlRNhFlmQeozQAv2qX4rQ=="


## XL
## NonProd
# vpc_id = "vpc-09a25a3c8b6353b7b"

# access_key = ""
# secret_key = ""
# token      = ""




## EC instance configuration

## Tableau
# tableau_instance_count = 1
tableau_instance_type = "r5.4xlarge"


## Collibra
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
sg_module_ssh   = "ssh-tcp"
sg_module_http  = "http-80-tcp"
sg_module_https = "https-443-tcp"

## tagging configuration
created_by    = "LTI"
generated_via = "terraform"
project_name  = "edm360ca"
environment   = "nonprod"

## tag for XL Non-Prod EC2 & S3
map-migrated = "mig34463"
