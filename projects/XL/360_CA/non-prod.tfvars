# AWS authentication configuration
# aws_profile                  = "lti-360"
# aws_region                   = "ap-southeast-3"
# aws_shared_credentials_files = ["/home/arry/.aws/credentials"]
# aws_shared_config_files      = ["/home/arry/.aws/config"]


# AWS environment configuration

## VPC configuration

## LTI
vpc_id = "vpc-04840b2bd106d70b4"

access_key = "ASIA5YDLWVT3I2PM5IPT"
secret_key = "fb1U/X4UBxIEeZr8VTDZW68bykMTIvegJ/j8xhZd"
token      = "IQoJb3JpZ2luX2VjELT//////////wEaDmFwLXNvdXRoZWFzdC0xIkgwRgIhAPei7l635IuFz93l5pcgBcgy3j7AYVlw5+e9M1NyDav/AiEAll5HG3KcYaojp4yx5TcTTM7Xje2Zo28OTYxjl7gHYyIq9QII/f//////////ARAAGgw5NDUxMTg2ODY0NTQiDMXWws6a6Fku59PD+irJAmum/1nlgWYQFGP8Kr3HhS9LESAokW0JN09r/jIt57v9e6QpwC47iYHSleUthdReqnSb2dymBysU18uF+L7SmRl7ab0ibKTlRtBrNzhkyVLwDzA18cZy0NemAoHsAk59ZLZH0cneJkMUoNrsB187pBtea3EJQEOnV0ydkXDha8uxqG+txphBOIn2AIpNxW+/vwsNqQ7KzQgB/jpmt6cOnkQq0HRPTBiddqpFNEvVRPo8MLtL5yx2oujNYM7pPsBcaNIvFX/7/gjSwwu5uPC3xdyJwlzj4tbJBhbIBhAH6p8qa3RNLQv02uZPtYXB368TkzEkgKtqfs0f/HgTJ71QsklsKf/n61wdJz2xEbGpISmPwZzSvXlKox3vBX1M7Q69eCuU/hcMn9DVPb1xMaR54KgdANrF0SDRzU+hrCjGkiYCvGCLnjFFZbVDMMnqpKQGOqYBnlvv3V/ypto1OVMAtpB+T4Z6lGU/17sKP3FNevCgf48GDBJAiQwL+mlE70UKxbjfOAPohoqQ+L35WIwejRUNlrjcB5aZj/DK1MC0J0BVoVEqPfIbYFFNRn6cSFE8SZ3Me1g7lmTak4GerEyFqtzA6cacnRsKutiTxBIEDEsbaqjPNI75+gw4AoQRxgo7rj+BDUBh5K3i6knaWHn2uESrvCdcJp8dyA=="


## XL
## NonProd
# vpc_id = "vpc-09a25a3c8b6353b7b"

# access_key = "ASIA2SFV734CWFYV7ZO7"
# secret_key = "6/07IE+wlAbkWSX/82gNnBfbc7vUNVJgZ5Sj9BrZ"
# token      = "IQoJb3JpZ2luX2VjENT//////////wEaDmFwLXNvdXRoZWFzdC0xIkcwRQIgIxwBxkwC12d03Lry2aqsOleGy940bhq4y9UbY20/p1UCIQCn7DjwGaalcVw3+ldhH82Igzpujwq3exbRPB06/0CIgyqRAwj9//////////8BEAAaDDcyNjIzMTE0NjI0NSIMChJn+FNAs3pjhlokKuUCogyCmQgrfMtMfjde0/MA1Env+vW1hqW50tFsxUu120z1qquW428yjGjgAmcLQvhLYUVuQZnxjlvLui61cW84F86dS4be8Jx3VWpN2YjhIyA1S7xAmJKjVMfuCRoFC+NpxY9wcQRM7zoV0mRQErI0Ix+XU2fUZmXTIUYiBK88FLP++Bid9vdW4r4oAWyaZLJLpIxZnt6NDMLwCXxmZDvrsYzrb02ef+wHyU1sMh6hPQHRCWbbEP3QTnC0Y43LrxqGo5EVppUuD7NEkzHR+IlLqqFg6OvTRPHwfc1D5f/lrIGtytyYiof8mJNgfeXqsFZasm8S0cH2d89fHtLZ5nJ9qbpakKwXz63XkyygtxKX5XoTZcFKcLpj1wXLyZMZ6XlgGOZ+U/PlqMeTYys27xSMgSlm7QURuDZBCMV/zb86YBpddvT7QkNw2Rg/fTg2/AgqhC5HwxObYIGgHLSZmCVPMGP8fNMxMJq6u6MGOqYByh30jIIHsVHPCR/iU4q4GI03n7xpHx7kkPkTih9xl8BkjRpTdFMyQ2k74Of8O50Z19Xh4rN57CjIJALVQIpgxaCUg7RMc/YKE8a/CS7VoYiCFRjjiL+wuj53nreP+W8pdSEgIpIbgKlmpwoHlxmGHZPElZ+5B4V7H+ExEeYSwanP5tZhtq/9Ba/7uqoCDJeUEXvmNH6F9jE7Ck0UuZG1cXCQ2JhZ3w=="




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
keypair_file  = "xl_360_CA.pem"
key_name      = "xl_360_CA_keypair"
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
environment   = "nonproduction"

## tag for XL Non-Prod EC2 & S3
map-migrated = "mig34463"
