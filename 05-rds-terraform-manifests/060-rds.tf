module "rds" {
  source = "github.com/terraform-aws-modules/terraform-aws-rds"
  identifier = "${local.name}-${var.rds_name}"

  ## DATABASE
  engine              = "postgres"
  family              = "postgres13"
  engine_version      = "13.12"
  db_name             = var.db_name  
  username            = var.rds_master_user
  password            = var.rds_password
  instance_class      = var.rds_instance_class
  storage_type        = var.rds_storage_type
  allocated_storage   = var.rds_allocated_storage
  manage_master_user_password = false
  multi_az            = false
  ## NETWORK
  create_db_subnet_group = true
  subnet_ids = data.terraform_remote_state.eks.outputs.private_subnets
  vpc_security_group_ids     = [data.terraform_remote_state.eks.outputs.cluster_primary_security_group_id]

  #False if this is for production or you need a snapshot before destroy
  skip_final_snapshot = true
}