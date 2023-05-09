provider "aws" {
  region = "ap-southeast-3"

  #access_key = "ASIA5YDLWVT3KI7JJ45V"
  #secret_key = "RO5IfKjPD9XM5BSGDDBoFrtGHuOB07qc+jkRsZxQ"
  # token = ""

}

resource "aws_instance" "dummy-instance" {
  # ami = "ami-0fe15b34a99c7962d"
  ami           = "ami-030f8301edf7198b0"
  instance_type = "t3.micro"
  subnet_id     = "subnet-057e056fcccb607fa"


  tags = {
    Name        = var.instance_name
    created_by  = "arry"
    created_via = "terraform"
  }
}

resource "aws_ec2_instance_state" "dummy-instance" {
  instance_id = aws_instance.dummy-instance.id
  state       = "stopped"
  # state = "running"
}
