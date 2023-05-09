provider "aws" {
  region = "ap-southeast-3"

  # access_key = "ASIA5YDLWVT3KI7JJ45V"
  # secret_key = "RO5IfKjPD9XM5BSGDDBoFrtGHuOB07qc+jkRsZxQ"
  # token = "IQoJb3JpZ2luX2VjEEwaDmFwLXNvdXRoZWFzdC0xIkcwRQIgCNRh27Fm5LUzc2vbEp5AKuYp9bazJxoAUkcS/OCmZJ8CIQD61gtyTK/F/jAcKeznkxJZoswKLN9yfny5/bVev3ZsSyrsAgglEAAaDDk0NTExODY4NjQ1NCIMIt/wup2BpY82bSs6KskCwhqeM8F2mq7g0bfKQkwFz2tYIy/bekzlbVhT3JNeqyYa3Cp3EiCuEkqJRpK01BQOYudSire/iSpYI/yCyxsDfdTbqKzKpxKfefCDQbioPEGSvza9sX/Rmyt3ZcW+iWwXUkIcUjK/fK3ccGDw8Ov73Qhy9kArAJ9T1CEjr06O4l+w1hlk5IyArJvEfNA94AHsk1u0Wrk7VLNtjrwYrw4rVKanKBLhXCdnwL5zR9m2uKS4YWuhl3SRgvCN68FnSlqQxO9RihbHB8RW3E6c5xyNo3+nevLzWbkybmL7sYXjN3y3ATiMPBdChHk3vWSOiB1dfh8ssdiDzZAURbuNclkcYa3EUDwhabpSBV/CrxppQx9NicnTcRlTlO1ClXRQJEaXIXYPnU/yTfLAru7cn7vj9wZM7QtMxMAh6+qoWV8nAwhMOmFihc5dHxEwtq6EoQY6pwFV4KP+yjZPHfSJ/bxyRPDdShYRw24Q7PJ7h+AtgVD1JNV9nt/jTRLuTxubvKgyAe3cRdnQP6+0S7kwy/PcWQFlJbFMILoh41km/cjy2FrQGMKdIPL4pV+Eql4vTqRWFxD/wf7Cfs8TByTxv/sUdA4PXsR7jcW2tYVXAIY7nnvVqP+qODy56bew8nQ32xM/eMYVHd50ksfc0C+TrGcn9BnLX/r8jyZBEw=="
}

resource "aws_vpc" "dummy_vpc" {
  cidr_block = "13.2.0.0/16"

  tags = {
    Name        = "ry.luis_02-vpc"
    created_by  = "arry"
    created_via = "terraform"
  }
}


