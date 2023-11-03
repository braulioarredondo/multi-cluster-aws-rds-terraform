#General Variables
variable "aws_region" {
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
