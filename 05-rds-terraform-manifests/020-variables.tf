variable "bucket"{
description = "Bucket in which remote state will be saved"
  type = string
  default = "terraform-multi-k8s"  
}  

variable "aws_region"{
description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"  
}  

variable "author" {
  description = "Your name"
  type = string
  default = "Braulio-Arredondo"  
}

variable "environment" {
  description = "Organization Environment"
  type = string
  default = "prod"  
}

variable "application" {
  description = "Project Name"
  type = string
  default = "multi-k8s"  
}