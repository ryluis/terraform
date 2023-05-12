# AWS authentication configuration
# aws_profile                  = "lti-360"
# aws_region                   = "ap-southeast-3"
# aws_shared_credentials_files = ["/home/arry/.aws/credentials"]
# aws_shared_config_files      = ["/home/arry/.aws/config"]


# AWS environment configuration

## VPC configuration

## LTI
# vpc_id = "vpc-04840b2bd106d70b4"

# access_key = "ASIA5YDLWVT3HPR2PANQ"
# secret_key = "wyUjh8SEUivuuTTlBjGfle8susRNjPw0A/0uSg02"
# token      = "IQoJb3JpZ2luX2VjEKL//////////wEaDmFwLXNvdXRoZWFzdC0xIkgwRgIhAMAQdTa1qktr3bdZJB/tUPMNaoMJKtannf6YsuyW5/igAiEAwHKDhFdeKXiyCMZX347KO6xy2I3By0xNKK3XbqvVpSEq9QIIu///////////ARAAGgw5NDUxMTg2ODY0NTQiDIqBLiWW68YcfJtXESrJAhCg1hsuA16kVWwPprAhcwD5lu6E8TbNOsW4TPvOKMuLnM7Nq/uqkbWdrURLw/qOPmqxbenm93YN9HPrQFHNEna2TeEO/0eYBscPOpUj2ZApyi6DVwGH/fhkgoaAh/93fGmQ8tdPXdfnJ96uDAgbcjAr1AvA8xf9zbJycWE8KeXgF9kLKgdCLKpNd4QWe164gYl60kyx9XLhQWfReMuvssXHMySH3Tbr/pT+rn9PalGHe/Bt4allNElVN15O6sTDdv0PB1qDoQlYRA2XnAiKsjCqPiGjQgC0PgPSOxLADuImA767egp85v1FpMtCH33LGYd5V/2hBr0iyEf5at3Ws8UX6+oX6NmXw2StsP/OyVbi4O/+ybAC+rfStw72R74Gl08ObQhHNSTsFt7ZcMewBL7B977/a7HyomHKzwVv+dkzbZfg+1TYpuKhMICO+KIGOqYB1VjpNu1tF7pcPcHJg6MdvbztbTKQHLAnhr6aGxgwKNUF6z0jQz3SdlwjdqGtQ17oeO2686emOREOZG178kBeLrvBuJaS4hYRJs4L/eIEd2kIQiKxMtufZmEws9SLqn43UUpVRcW/jd15Y2Xd0hJ7TVucBoSoo4GeVmOjaGG6nRQmiby33UPlhVSsJfxES/J436sbzAd/gZYd0CnnwBJdiccxKgq8Ag=="


## XL
## NonProd
vpc_id = "vpc-09a25a3c8b6353b7b"

access_key = "ASIA2SFV734C5IIHRPES"
secret_key = "yUCtEOUS0/HNkO9byH9CqoB+zPHl3krUnDw7aGTG"
token      = "IQoJb3JpZ2luX2VjEKL//////////wEaDmFwLXNvdXRoZWFzdC0xIkcwRQIgcbYxv0Q0FAFLX7x40RO0y9IBu1wPdq3E50rxJODpu4oCIQCc2dPARyaCeOVsriyAaaH+QxcWms7Tv0RxGhnRXTHDuiqRAwi7//////////8BEAAaDDcyNjIzMTE0NjI0NSIMoRiV4VE7Go/HAzF0KuUCh5E6vWMmxPfcpHjpyFJjKo+z9+7aKgjrJkP+Hk2Yo4OprfHYwHSlBUNgmEg9iumSuYw8MdOFNo6WdAYW28YAmI3oeMgJBR+qKGV3o0Cd2HljbFNB4zfGCxzNW4IT9FQENeRZ/6JVPBofdAXnRyTHzzXh1OzQB9+L4w1uDiUEi4E4tRrRReR5kp5/EviTS7AHYtWGCuyluB77J38iPNnZXgs7/G4olS3uA9M+m5jfvIRUmHnuYvlnGhYLPqH8fU3zSlt5qjUJzx9CmFNvi44vigS7cpCbCTixFpUwN+QOaYB80oLkEvxSspypw9ff70qICmpAsp1oPn0khLZbDtG6tENY2Y0/v1ureVMGlJgQL97ue4B2aa8JLn08Vyob6fkRavQ/MPg/TlJKy3reXBnJDfyPdjdUyp+xCIrIOegQiZ8Ueg1n0bbH3WnvlGM9UxDK3D5wVBbIbo0uOfoeA9MvQy8FxYlUMMqZ+KIGOqYBzcW5huZbiQZDeNATBCs1FqB2zseWtLQ4QfH7YbZkV4gwRjV3vAeiEWzBrWLw6eh5ogWkvTbUJzbti5K7rdX+Pscq5EHIIu97xyMvkyRlgdR5VUbTzStasLA43I3MsUnR4XIb74hjJ6Wp7oRftWPFCW2xvZhnXRQ4RkNSD7U5gUE/fMfazZdZ/2aOFGanDYEuivzkuNvK+aSR0tmlCea7S/pDGdnrug=="




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
