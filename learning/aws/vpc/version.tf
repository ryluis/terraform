terraform {
   cloud {
    organization = "ry_luis"
    
    workspaces {
      name = "aws-vpc"
    }
  }
  
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.1"
    }
  }
}