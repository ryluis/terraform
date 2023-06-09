variable "aws_region" {
  type        = string
  description = "aws region"
  default     = "ap-southeast-3"
}

variable "aws_shared_config_files" {
  type        = list(any)
  description = "aws config files"
  default     = []
}

variable "aws_shared_credentials_files" {
  type        = list(any)
  description = "aws credential files"
  default     = []
}

variable "aws_profile" {
  type        = string
  description = "aws profile"
  default     = ""
}

variable "tableau_instance_count" {
  type        = number
  description = "number of instances"
  default     = 1
}

variable "tableau_instance_type" {
  type        = string
  description = "type of instances"
  default     = "t3.micro"
}

variable "tableau_user_data" {
  type        = string
  description = "user data"
  default     = ""
}

variable "collibra_instance_count" {
  type        = number
  description = "number of instances"
  default     = 1
}

variable "collibra_instance_type" {
  type        = string
  description = "type of instances"
  default     = "t3.micro"
}

variable "protected_subnets" {
  type        = list(string)
  description = "list of protected subnets"
  default     = []
}
variable "private_subnets" {
  type        = list(string)
  description = "list of private subnets"
  default     = []
}

variable "public_subnets" {
  type        = list(string)
  description = "list of public subnets"
  default     = []
}

variable "vpc_cidr" {
  type        = string
  description = "cidr of vpc"
  default     = ""
}

variable "vpc_name" {
  type        = string
  description = "name of vpc"
  default     = ""
}

variable "key_name" {
  type        = string
  description = "key pair name value"
  default     = ""
}

variable "key_algorithm" {
  type        = string
  description = "key algorithm value"
  default     = ""
}

variable "key_bit_size" {
  type        = number
  description = "keys bit size"
  default     = 4096
}

variable "keypair_dir" {
  type        = string
  description = "directory for storing keypair file"
  default     = ""
}

variable "keypair_file" {
  type        = string
  description = "keypair file"
  default     = ""
}

variable "image_id" {
  description = "AWS image id"
  type        = list(string)
  default     = []
}

variable "root_volume_size" {
  type        = number
  description = "disk volume size value"
  default     = 20
}

variable "root_volume_type" {
  type        = string
  description = "disk volume type value"
  default     = "gp3"
}

variable "root_is_encrypted" {
  type        = bool
  description = "disk encrypted boolean value"
  default     = false
}

variable "root_is_delete_on_termination" {
  type        = bool
  description = "delete on terminataion boolean value"
  default     = true
}

variable "ebs1_device_name" {
  type        = string
  description = "disk name value"
  default     = "/dev/xvda"
}

variable "ebs1_volume_size" {
  type        = number
  description = "disk volume size value"
  default     = 20
}

variable "ebs1_volume_type" {
  type        = string
  description = "disk volume type value"
  default     = "gp3"
}

variable "ebs1_is_encrypted" {
  type        = bool
  description = "disk encrypted boolean value"
  default     = false
}

variable "ebs1_is_delete_on_termination" {
  type        = bool
  description = "delete on terminataion boolean value"
  default     = false
}

variable "is_associate_public_ip_address" {
  type        = bool
  description = "associated with public ip address boolean value"
  default     = true
}

variable "sg_module_ssh" {
  type        = string
  description = "ssh security group module"
  default     = "ssh-tcp"
}

## variables for tagging
variable "created_by" {
  type    = string
  default = ""
}

variable "generated_via" {
  type    = string
  default = ""
}

variable "project_name" {
  type    = string
  default = ""
}

variable "environment" {
  type    = string
  default = ""
}
variable "map-migrated" {
  type    = string
  default = ""
}
