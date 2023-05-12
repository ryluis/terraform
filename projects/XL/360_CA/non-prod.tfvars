# AWS authentication configuration
# aws_profile                  = "lti-360"
# aws_region                   = "ap-southeast-3"
# aws_shared_credentials_files = ["/home/arry/.aws/credentials"]
# aws_shared_config_files      = ["/home/arry/.aws/config"]


# AWS environment configuration

## VPC configuration

## LTI
# vpc_id = "vpc-04840b2bd106d70b4"

# access_key = "ASIA5YDLWVT3OTW3TYBY"
# secret_key = "Q8+BxZPGCT5H52EOU/RRFJu5RzwxHioDPIOOltsw"
# token      = "IQoJb3JpZ2luX2VjEJz//////////wEaDmFwLXNvdXRoZWFzdC0xIkgwRgIhALSRofl2dfFS1hI7dn9hylWV3O62P21ieumMx2nq55acAiEAyfNGSmKuhfEoR/cwbirSwO2pNRlbun2Eme+VcdHQgfAq9QIItf//////////ARAAGgw5NDUxMTg2ODY0NTQiDPBPBMpdADBfDhsZbSrJAp6x4lJ4y3EHVob+ZzZzs8NcUr8NZu/fHRezXfix4jR/cplNqM2y+pYc/CZJEwWDAe4YfmB3c1HzkvYS0V2GL0K0jqvTMvHVEroZSyotYElutTYqdeFZ7uq/hFEb5HT7XmvX4mKFfkNMln1MNfAQuGtudikXHlyDfDZW3ui5rVPNsWlwpONJya5ZFoLosAl5Ltoht988uglBxpKdHdGuRuLSfwvDMXAva1OBLg7aguyrRQHP2mxVv7UDRSECjxGMOmoHokFExpVrrUtLFjZK3a1JTc6BwiDB2NA3C284jJGfRd6chxFxOjNmj+wy8/I6dzMYgpYocwSWCaf8+BxFddyyq8MUKcFReldTuYYhxdVfPAX4aNHAhPUFMkykJ3dt+u9dl/tE8AIQxHncnwuu3PBMOjXFYGedklW+X+yJk9RNp6hjgwsKpIeuMOv49qIGOqYB0u5tfCgT3htjdtP/5cfxZL68uLa1h+/5x3Q/o4iQHLXT+tjlsahQZ/yttolJUNpWt6iLGH8Z8aNEAMfD3m9zDawKIolHScsyzbBHkHRscagLqPO6upKMBbPrRo+ZkKn2/MVwcQtlafTYqRkzoPEHzLMXoSfGQ4PbzOL4ejs95uMXu58z1KPgGNZOxSGP6CzzEGoAXTBfAeJUb16+f9tMJ4+SLdajbQ=="


## XL
## NonProd
access_key = "ASIA2SFV734C3CRH3R7F"
secret_key = "Z2dvceKJ1qPQ3y17GgobjxRFUJmGWJOZYBLRFIgX"
token      = "IQoJb3JpZ2luX2VjEJ///////////wEaDmFwLXNvdXRoZWFzdC0xIkgwRgIhAPLcrgnKYVprq5Ui9hzus4Au0Pa5+duNlexcIszSIoTvAiEAgnD9BBKPbjnOQ24uU9gWaZCN0lmDCG1VXOzNde+GIrAqkQMIuf//////////ARAAGgw3MjYyMzExNDYyNDUiDHvKAtEI3G/g5TPQCirlAhNhxLq80Hop4lyxuPNtsXxxtb3mJKkV6iakY4SuMDZi566mj49VBRLSOfkN3hY4uz/Se2AHgjRmO/ppzm7j0iQmOwUyCYxaQuRsO00ADAXCbBvJ/Gt+wiIcLL8t3yNlwQpBNpuxTSUYxu7pq2vFZQG6sVZjKrEDokUD/QnK1SCZ3+rckSoukLOnaJK5/B9n40WY8KYsjrEiYwXCFmgtgmdw1BPykGTDaz4BKyIYsgNcGM+hFa8xEbb8DOA3pdNjuqoAApgXEMNUW7AcpgpPCNpW9AznsTiOz6WZfZkEIBhEO1iXPQu3I27UB3TViK5W8WfHChCbsiksTO7Q+lfuQUTYHhDBHK2nEsY+Tg7WcTp5Nzuxq+gnQIru0fzdRXX4BiniweVc8T2cpjza0oovqxvolN2j8OTEEcEPUtVgYv1iRRLtyjjFVv74NaxYOnfJoTW1Be3Ge4sFjeGvgwF0UpvFpE1F1TCr0veiBjqlAWxdvd7+INilBjrx2e9p2KnrAfC7PpXKmpopAKvSlsC16CIOcuVfdQD7Bd0mH4f/ZkjbguPZcmbfe1pCirxWWzw4nffSj1O0Un3KV4XUYikPIDTTJGdAQS7x3chC3URxaI5zo9Ycr5rUBSJ9Iw+3FEQ2uAgejD9Nl/+bViYETKE0pI3CIpPmZwY/ERysBcSqgXE+eXrzfDxGzubtTd7ZSlSWgN2CiA=="

vpc_id = "vpc-09a25a3c8b6353b7b"



## EC instance configuration
tableau_instance_count = 1
# tableau_instance_count = length(data.aws_subnet.list_of_private_subnet)
tableau_instance_type = "m5.4xlarge"
# tableau_instance_type = "t3.micro"


collibra_instance_count = 1
collibra_instance_type  = "m5.4xlarge"



is_associate_public_ip_address = true


## root volume configuration
root_volume_size              = 50
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
