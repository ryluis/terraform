variable "az_list" {
  type        = list(string)
  description = "List of availibity zones"
  default     = []
}

variable "instance_count" {
  description = "number of instance"
  type        = number
}

variable "instance_type" {
  description = "Type of EC2 instance to use"
  type        = string
}

variable "instance_image_id" {
  description = "image_id for EC2 instance to use"
  type        = string
}

variable "instance_subnet_ids" {
  description = "Subnet IDs for EC2 instances"
  type        = list(string)
}

variable "instance_security_group_ids" {
  description = "Security group IDs for EC2 instances"
  type        = list(string)
}

variable "instance_tags" {
  description = "Tags for instances"
  type        = map(any)
  default     = {}
}

variable "ebs_volume_count" {
  type        = number
  description = "number of ebs volume"
  default     = 1
}

variable "is_enable" {
  type        = bool
  description = "boolean true value"
  default     = true
}

variable "is_associate_public_ip_address" {
  type        = bool
  description = "associated with public ip address boolean value"
  default     = true
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

variable "instance_key_name" {
  type        = string
  description = "instance key pair name value"
  default     = ""
}

variable "instance_user_data" {
  type        = string
  description = "user data value"
  default     = ""
}
