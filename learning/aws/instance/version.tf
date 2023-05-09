terraform {
   cloud {
    organization = "ry_luis"
    
    workspaces {
      name = "aws-instance"
    }
  }
  
   required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.1"
    }
  }
}