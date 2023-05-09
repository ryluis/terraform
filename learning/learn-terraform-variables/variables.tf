variable "aws_region" {
  type        = string
  description = "aws region"
  default     = "ap-southeast-3"
}

variable "shared_config_files" {
  type        = list(any)
  description = "aws config files"
  default     = ["/home/arry/.aws/config"]
}

variable "shared_credentials_files" {
  type        = list(any)
  description = "aws credential files"
  default     = ["/home/arry/.aws/credentials"]
}

variable "aws_profile" {
  type        = string
  description = "aws profile"
  default     = "lti-360"
}

variable "instance_count" {
  type        = number
  description = "number of instances"
  default     = 2
}

variable "instance_type" {
  type        = string
  description = "type of instances"
  default     = "t3.micro"
}

variable "tags" {
  type        = map(string)
  description = "tagging values"
  default = {
    "project_name" = "project_alpha",
    "environment"  = "dev"
  }
}

variable "private_subnets" {
  type        = list(string)
  description = "list of private subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "public_subnets" {
  type        = list(string)
  description = "list of public subnets"
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "is_enable" {
  type        = bool
  description = "boolean true value"
  default     = true
}

variable "vpc_cidr" {
  type        = string
  description = "cidr of vpc"
  default     = "10.0.0.0/16"
}
