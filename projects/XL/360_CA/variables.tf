variable "aws_region" {
  type        = string
  description = "aws region"
  default     = "ap-southeast-3"
}
variable "access_key" {
  type        = string
  description = "value"
  default     = ""
}
variable "secret_key" {
  type        = string
  description = "value"
  default     = ""
}
variable "token" {
  type        = string
  description = "value"
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "list of vpc id value"
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

variable "ebs_volume_count" {
  type        = number
  description = "number of ebs volume"
  default     = 1
}

variable "ebs2_device_name" {
  type        = string
  description = "disk name value"
  default     = "/dev/xvdb"
}

variable "ebs2_volume_size" {
  type        = number
  description = "disk volume size value"
  default     = 20
}

variable "ebs2_volume_type" {
  type        = string
  description = "disk volume type value"
  default     = "gp3"
}

variable "ebs2_is_encrypted" {
  type        = bool
  description = "disk encrypted boolean value"
  default     = false
}

variable "ebs2_is_delete_on_termination" {
  type        = bool
  description = "delete on terminataion boolean value"
  default     = false
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

variable "tableau_ebs1_device_name" {
  type        = string
  description = "disk name value"
  default     = "/dev/xvda"
}

variable "tableau_ebs1_volume_size" {
  type        = number
  description = "disk volume size value"
  default     = 20
}

variable "tableau_ebs1_volume_type" {
  type        = string
  description = "disk volume type value"
  default     = "gp3"
}

variable "tableau_ebs1_is_encrypted" {
  type        = bool
  description = "disk encrypted boolean value"
  default     = false
}

variable "tableau_ebs1_is_delete_on_termination" {
  type        = bool
  description = "delete on terminataion boolean value"
  default     = false
}


variable "collibra_ebs1_device_name" {
  type        = string
  description = "disk name value"
  default     = "/dev/xvda"
}

variable "collibra_ebs1_volume_size" {
  type        = number
  description = "disk volume size value"
  default     = 20
}

variable "collibra_ebs1_volume_type" {
  type        = string
  description = "disk volume type value"
  default     = "gp3"
}

variable "collibra_ebs1_is_encrypted" {
  type        = bool
  description = "disk encrypted boolean value"
  default     = false
}

variable "collibra_ebs1_is_delete_on_termination" {
  type        = bool
  description = "delete on terminataion boolean value"
  default     = false
}


variable "collibra_ebs2_device_name" {
  type        = string
  description = "disk name value"
  default     = "/dev/xvda"
}

variable "collibra_ebs2_volume_size" {
  type        = number
  description = "disk volume size value"
  default     = 20
}

variable "collibra_ebs2_volume_type" {
  type        = string
  description = "disk volume type value"
  default     = "gp3"
}

variable "collibra_ebs2_is_encrypted" {
  type        = bool
  description = "disk encrypted boolean value"
  default     = false
}

variable "collibra_ebs2_is_delete_on_termination" {
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
