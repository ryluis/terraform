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
# secret_key = "V3AqSfcT10hzyhMqMKy0AsWPM0x6dp1hk+ppS+vN"
# token      = "IQoJb3JpZ2luX2VjELv//////////wEaDmFwLXNvdXRoZWFzdC0xIkcwRQIhAJwPlZruWX6c4xCeaPd4nVP0zSCg8wGuy/rg1vjF19gfAiAUK8TBJ5bWjMIm4YHNEATD+QishQAOctyO57o723he4Cr1Agjk//////////8BEAAaDDk0NTExODY4NjQ1NCIMgUXtUVdQ/U3Y9/VlKskCUFCPIog/riE51LwHwB4iGVcMj85AgYy4murJrcCUgxpig35diETIdTUg8dk/qyTNNj4203aA7ytZkfn2L4Ktw3LntAFKDLApYc032D1pkvmGuC5rzqiTj/T7VJursWNPwdcyCuwZUGLxR3yMBYBbmo5zRK7BLwXaScVg2Bbv0qa6mVxG6m4FpsJx63KA62paa3HRBcsFY6MhTLJCir5o5cp4on5DjZdQVd2kGP3K6VMRj7tKIr7nB6Oq82fVzXG8daMg+eGpkrE03IFgQR8yFK6dg5tmg/ujPMMv1XWvkLvZYM8h1TPh3Vy/ekc2RoEDPBoM0BbhUknPrafJqa0F+6npLE0MzQsTjSBIDN6pDlICOPBx03WUfovwGRAIU21CzCprn1p5VnVqfY31+8XwB74/5jPe8ITjOSaaK2jeMADrf7hnblralBYwq/q1owY6pwEpn2iMUMMenlZSMYY/BsPo36/LCjVfIM4v+sAMDXRbwIsqLPX8JLIRmMgp29lzJLDRgHyyQpyncisj3FKbK3SSMqSXSLZAzwZ2GaMGW036UeJGuuIANRiP0ovPlsckdAqkSCfuxxXI4DtjL5nNsk3k6DFDhpyU4ga2XMPERTCoDUP6I+zTnqPbBSgAR/W0ariO55q0rZSXtLlRNhFlmQeozQAv2qX4rQ=="


## XL
## NonProd
vpc_id = "vpc-09a25a3c8b6353b7b"

access_key = "ASIA2SFV734CWFYV7ZO7"
secret_key = "6/07IE+wlAbkWSX/82gNnBfbc7vUNVJgZ5Sj9BrZ"
token      = "IQoJb3JpZ2luX2VjENT//////////wEaDmFwLXNvdXRoZWFzdC0xIkcwRQIgIxwBxkwC12d03Lry2aqsOleGy940bhq4y9UbY20/p1UCIQCn7DjwGaalcVw3+ldhH82Igzpujwq3exbRPB06/0CIgyqRAwj9//////////8BEAAaDDcyNjIzMTE0NjI0NSIMChJn+FNAs3pjhlokKuUCogyCmQgrfMtMfjde0/MA1Env+vW1hqW50tFsxUu120z1qquW428yjGjgAmcLQvhLYUVuQZnxjlvLui61cW84F86dS4be8Jx3VWpN2YjhIyA1S7xAmJKjVMfuCRoFC+NpxY9wcQRM7zoV0mRQErI0Ix+XU2fUZmXTIUYiBK88FLP++Bid9vdW4r4oAWyaZLJLpIxZnt6NDMLwCXxmZDvrsYzrb02ef+wHyU1sMh6hPQHRCWbbEP3QTnC0Y43LrxqGo5EVppUuD7NEkzHR+IlLqqFg6OvTRPHwfc1D5f/lrIGtytyYiof8mJNgfeXqsFZasm8S0cH2d89fHtLZ5nJ9qbpakKwXz63XkyygtxKX5XoTZcFKcLpj1wXLyZMZ6XlgGOZ+U/PlqMeTYys27xSMgSlm7QURuDZBCMV/zb86YBpddvT7QkNw2Rg/fTg2/AgqhC5HwxObYIGgHLSZmCVPMGP8fNMxMJq6u6MGOqYByh30jIIHsVHPCR/iU4q4GI03n7xpHx7kkPkTih9xl8BkjRpTdFMyQ2k74Of8O50Z19Xh4rN57CjIJALVQIpgxaCUg7RMc/YKE8a/CS7VoYiCFRjjiL+wuj53nreP+W8pdSEgIpIbgKlmpwoHlxmGHZPElZ+5B4V7H+ExEeYSwanP5tZhtq/9Ba/7uqoCDJeUEXvmNH6F9jE7Ck0UuZG1cXCQ2JhZ3w=="




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
environment   = "nonproduction"

## tag for XL Non-Prod EC2 & S3
map-migrated = "mig34463"
