variable "rds_name" {
  description = "Name of the RDS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "terraform-multi-k8s-rds"
}

variable "rds_engine_version" {
  description = "Postgres engine version."
  type        = string
  default     = "16.0"
}

variable "db_name" {
  description = "Name of the Database. EKS cluster and other services will query this DB."
  type        = string
  default     = "fibvalues"
}

variable "rds_az" {
  description = "AZ on which the RDS will be placed."
  type        = list
  default     = ["us-east-1"]
}

variable "rds_instance_class" {
  description = "RDS cluster instance class."
  type        = string
  default     = "db.t3.micro"
}

variable "rds_storage_type" {
  description = "RDS storage type."
  type        = string
  default     = "gp2"
}


variable "rds_allocated_storage" {
  description = "RDS storage disk size in GB."
  type        = string
  default     = "20"
}

variable "rds_master_user" {
  description = "RDS cluster default master user."
  type        = string
  default     = "postgres"
}

variable "rds_password" {
  description = "RDS cluster master user password."
  type        = string
  nullable    = false
}

