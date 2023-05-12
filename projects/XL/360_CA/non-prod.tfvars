# AWS authentication configuration
# aws_profile                  = "lti-360"
# aws_region                   = "ap-southeast-3"
# aws_shared_credentials_files = ["/home/arry/.aws/credentials"]
# aws_shared_config_files      = ["/home/arry/.aws/config"]


# AWS environment configuration

## VPC configuration

## LTI
vpc_id = "vpc-04840b2bd106d70b4"

access_key = "ASIA5YDLWVT3HPR2PANQ"
secret_key = "wyUjh8SEUivuuTTlBjGfle8susRNjPw0A/0uSg02"
token      = "IQoJb3JpZ2luX2VjEKL//////////wEaDmFwLXNvdXRoZWFzdC0xIkgwRgIhAMAQdTa1qktr3bdZJB/tUPMNaoMJKtannf6YsuyW5/igAiEAwHKDhFdeKXiyCMZX347KO6xy2I3By0xNKK3XbqvVpSEq9QIIu///////////ARAAGgw5NDUxMTg2ODY0NTQiDIqBLiWW68YcfJtXESrJAhCg1hsuA16kVWwPprAhcwD5lu6E8TbNOsW4TPvOKMuLnM7Nq/uqkbWdrURLw/qOPmqxbenm93YN9HPrQFHNEna2TeEO/0eYBscPOpUj2ZApyi6DVwGH/fhkgoaAh/93fGmQ8tdPXdfnJ96uDAgbcjAr1AvA8xf9zbJycWE8KeXgF9kLKgdCLKpNd4QWe164gYl60kyx9XLhQWfReMuvssXHMySH3Tbr/pT+rn9PalGHe/Bt4allNElVN15O6sTDdv0PB1qDoQlYRA2XnAiKsjCqPiGjQgC0PgPSOxLADuImA767egp85v1FpMtCH33LGYd5V/2hBr0iyEf5at3Ws8UX6+oX6NmXw2StsP/OyVbi4O/+ybAC+rfStw72R74Gl08ObQhHNSTsFt7ZcMewBL7B977/a7HyomHKzwVv+dkzbZfg+1TYpuKhMICO+KIGOqYB1VjpNu1tF7pcPcHJg6MdvbztbTKQHLAnhr6aGxgwKNUF6z0jQz3SdlwjdqGtQ17oeO2686emOREOZG178kBeLrvBuJaS4hYRJs4L/eIEd2kIQiKxMtufZmEws9SLqn43UUpVRcW/jd15Y2Xd0hJ7TVucBoSoo4GeVmOjaGG6nRQmiby33UPlhVSsJfxES/J436sbzAd/gZYd0CnnwBJdiccxKgq8Ag=="


## XL
## NonProd
# vpc_id = "vpc-09a25a3c8b6353b7b"

# access_key = "ASIA2SFV734C3CRH3R7F"
# secret_key = "Z2dvceKJ1qPQ3y17GgobjxRFUJmGWJOZYBLRFIgX"
# token      = "IQoJb3JpZ2luX2VjEJ///////////wEaDmFwLXNvdXRoZWFzdC0xIkgwRgIhAPLcrgnKYVprq5Ui9hzus4Au0Pa5+duNlexcIszSIoTvAiEAgnD9BBKPbjnOQ24uU9gWaZCN0lmDCG1VXOzNde+GIrAqkQMIuf//////////ARAAGgw3MjYyMzExNDYyNDUiDHvKAtEI3G/g5TPQCirlAhNhxLq80Hop4lyxuPNtsXxxtb3mJKkV6iakY4SuMDZi566mj49VBRLSOfkN3hY4uz/Se2AHgjRmO/ppzm7j0iQmOwUyCYxaQuRsO00ADAXCbBvJ/Gt+wiIcLL8t3yNlwQpBNpuxTSUYxu7pq2vFZQG6sVZjKrEDokUD/QnK1SCZ3+rckSoukLOnaJK5/B9n40WY8KYsjrEiYwXCFmgtgmdw1BPykGTDaz4BKyIYsgNcGM+hFa8xEbb8DOA3pdNjuqoAApgXEMNUW7AcpgpPCNpW9AznsTiOz6WZfZkEIBhEO1iXPQu3I27UB3TViK5W8WfHChCbsiksTO7Q+lfuQUTYHhDBHK2nEsY+Tg7WcTp5Nzuxq+gnQIru0fzdRXX4BiniweVc8T2cpjza0oovqxvolN2j8OTEEcEPUtVgYv1iRRLtyjjFVv74NaxYOnfJoTW1Be3Ge4sFjeGvgwF0UpvFpE1F1TCr0veiBjqlAWxdvd7+INilBjrx2e9p2KnrAfC7PpXKmpopAKvSlsC16CIOcuVfdQD7Bd0mH4f/ZkjbguPZcmbfe1pCirxWWzw4nffSj1O0Un3KV4XUYikPIDTTJGdAQS7x3chC3URxaI5zo9Ycr5rUBSJ9Iw+3FEQ2uAgejD9Nl/+bViYETKE0pI3CIpPmZwY/ERysBcSqgXE+eXrzfDxGzubtTd7ZSlSWgN2CiA=="




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
