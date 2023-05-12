# AWS authentication configuration
# aws_profile                  = "lti-360"
# aws_region                   = "ap-southeast-3"
# aws_shared_credentials_files = ["/home/arry/.aws/credentials"]
# aws_shared_config_files      = ["/home/arry/.aws/config"]


# AWS environment configuration

## VPC configuration

## LTI
# vpc_id = "vpc-04840b2bd106d70b4"

# access_key = "ASIA5YDLWVT3LINPRKWB"
# secret_key = "qFMnM8m5duqJhFInJR4e+2kk3QREWyUX0Fz/9jzd"
# token      = "IQoJb3JpZ2luX2VjEKf//////////wEaDmFwLXNvdXRoZWFzdC0xIkcwRQIgEvtlKaVyYeDp11KLEZwYC6TWhPhQlJewOp7pcCzbVkUCIQDXzRPjYwl0HkxjeqQt8qevoIo4SKL2xaSpPAaXtl1fcyr1AgjA//////////8BEAAaDDk0NTExODY4NjQ1NCIMIXMHdOBdYhCj/QqTKskCAy4GwafLRrjSQnRhGm1Z1/D9IzgJQpcFLO8DkRrdyo0+ryXGk0o7aaaG/mupMPg/NKGU2Q1i1woD1ED0q/pj0rPh51QvPb9GrrE1HHA/Mcf2FL3IBzKtX3emNOZ3EQHIRJKTAkSolWxwbvl19Jfyy+VK7xEbu4/5ypFgfBFDGEl/rDCsaqYvUfWZ73TQ9PGyJtkfqrvB6mmTvHsl+euD52/xUmLIZC8n6zbnp4w7XB0ZO27sHtV4mfFEop6RBmUQJtqsFy0ABcqW7i0tM5rFAYX+1j1dsRMQEOi4CtmlgJ+d7ktSDIHBA75+0cIh+FM+YwodX4rZX791d0Eysp1QRsIPs6mvpMv9L6VQyBse9cjlqVyEdwySmzlMEXrYEDFrDS3OkM97mntrcostXwhpstHqX6cCyWW/2qGkOVTENHezIiNiePL8FXYw+Jj5ogY6pwF0e+rVRnaGuPJGcWLfwV3OkGyJ/OR0gYOzsIyWPsr4vR1LHi6FJeG4LUuKg8wi+yegJ/BSOjaG+Dmq8dtLJ+5T65BuQrcSovrBtrVFWOuj3MnQ8JJlv35b6jAArkkb72d0EsRbtv3GtGZZj8qNzKPU6MHpTurlgHevCVumOa83kTWJcRd1F1mpLDeAe2jfVO744HU5M5VDaEy2vuC2dOQICpuN0iwHxQ=="


## XL
## NonProd
vpc_id = "vpc-09a25a3c8b6353b7b"

access_key = "ASIA2SFV734C2QUJB725"
secret_key = "uLWcqUFZfJYTN3G6efAmWvUo+PvLpQWiP72zwC4o"
token      = "IQoJb3JpZ2luX2VjEKb//////////wEaDmFwLXNvdXRoZWFzdC0xIkYwRAIgFV+pFh+2Mlm790TkL34hLj6jahESRCC6dJiF07LnRsACIEJjIK7iAdjKEhGh+9JCSAGxwqxvTHIMI+HV5GoDAOhuKpEDCL///////////wEQABoMNzI2MjMxMTQ2MjQ1IgwgN2LIavVg3SoXfrcq5QISCq2BSzZnSZO0F8Ew30ZhT2KMWQCJjhoeSAYfrumBWKhuNOQiej9932Gy+eT/pnMsfOs4F9oRUpei1xoaP62OcnqEKhZbnLAZPEKG1vMQG/WqQYYNmUq/Sxkbtq7MiKCVnJtr70kcAwYjOOFOkT2Ch/Hpvj2wrg51M8owroGUDa7KZsTYgEdbLtSuaDGXZmxt8IPK8zJcqh5gJWjYwR7N+msZN1zg6OSria/07v5CoifSf4y3BlRqfP5OBIPeHqxkJGEmos6cNKYg3K6wr45lwR4apEGz/cwxghFi0anGF2uMeaTRHotXUHHcWd9kUA4ILN8ccBgtaOJM25Vc/h3xR6Z4BerAvIKLBrRRpokb0hwDc7wp8b52C13PsnwZ3tCyrEF5fFEWwCauFS5G0Ymb/qnd1aop3zlOccqTryBeza0wBHg4fLluVZ8mPi9THDWmQmfP+7n0CMw1FALy+c5sdWCjwvkwk4b5ogY6pwEkFaC+op5c1oULPRQEK8xLYBRMFgX6000Aepqhk5oy3ydTlXE+w83U3Y6iwCoEIXgrLjF+/m3881Thgu0Uu+ScDR4myYzXHz3tCF5FMwhvmsThTW7CSEvRgJWuBx5n0wiiIe+jCk78bDEZIwMVqavHtkU/hzW//JfADqlM/Vh9Pi0055ds3t/63s+Z7MVFdAuAxaFipMEhysPey0pnc5D1iKCa52LIBQ=="




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
