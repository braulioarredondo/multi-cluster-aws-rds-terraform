# Terraform Settings Block
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.65"
     }
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.11"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.20"
    }      
  }
  backend "s3" {
    bucket = "terraform-multi-k8s"
    key    = "aws-lbc-nginx/terraform.tfstate"
    region = "us-east-1" 
    # For State Locking
    dynamodb_table = "terraform-lbc-nginx"    
  }     
}

# Terraform AWS Provider Block
provider "aws" {
  region = var.aws_region
}
