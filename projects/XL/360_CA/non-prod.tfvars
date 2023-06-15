# AWS authentication configuration
# aws_profile                  = "lti-360"
# aws_region                   = "ap-southeast-3"
# aws_shared_credentials_files = ["/home/arry/.aws/credentials"]
# aws_shared_config_files      = ["/home/arry/.aws/config"]


# AWS environment configuration

## VPC configuration

## LTI
vpc_id = ""

<<<<<<< HEAD
access_key = ""
secret_key = ""
token      = ""
=======
access_key = "ASIA5YDLWVT3FUF3UJEH"
secret_key = "YuaMmvJQ2j8u0cGomoZhYCQ1UBamoqnCMBRA4K54"
token      = "IQoJb3JpZ2luX2VjEMz//////////wEaDmFwLXNvdXRoZWFzdC0xIkcwRQIhAIOjPgA8NHug6q6xOjOsDjv4qvt3VxD95zNuKi5tpPFuAiALbds6LJoL9I8mrw6qkfo0cPtsowbbIMomjR2VC3KIPCrsAgglEAAaDDk0NTExODY4NjQ1NCIM+w/+bSiAjyP8J5w1KskCtn9B5nnZbhPEZxPf0bHqAyIlB3obWr+pHQz6h60hfP2VR5TJ3lNEQVBtZLb3ARh5//l271eA2eb380vsK7L0hkY32Np6dEokKRAVYjzFZ4DpUuF/aWwNnd1LjJvSdwltvYvQT9Ex1xAFhUVNCqJlC9TgHaEzPDYsaBEEBGcJMoxoEsvtXHAyW3GyjBM+pBCXtaiahqgnfoQLSjLQtC6xnJm2jEEYYKQoYzpOlo7p2T4GiaHKa8KZf7rLxNgr1+uD4tIDrdOvXlGcgNtH8ctZTMJptuaPIdbOvZNb2/Lek1RmeeSFmkTD6LtqwCGGZFjAI+ED4C+rbyowEsrPaotXZgw0kqQF7HNbG7lbhga6sjR7NllkagD/LXNMtzyOGwZbaB3edZ0+L2l1RMidPA7zhgkGcZS0v+VawZk+DeaybJd8qjskvVdLNtAwrZiqpAY6pwF0jNDW16flhEp/L3ZxnYb4wHlrUE5ywRzkqQR1CV8rPkjNPeEhqpo6iw6pqzgW1Ki3iv6ka9AfJWWPfn1Th+GCVAmA06ir/jzHBx/DWB/IdkEEHSNmIIg4cAuNn1KTDzbSYob3MfmPN2rlPwbqz7ELgy2n1Q5ZPF3GvmtKct341D06WCYq3H9U0b84MtbPuCBAcn9yunFviX0GVHv544LtitPwDNhKKQ=="
>>>>>>> e893713 (Update)


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
