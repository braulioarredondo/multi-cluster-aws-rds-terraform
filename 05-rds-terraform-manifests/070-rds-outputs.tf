output "rds_cluster_endpoint" {
    value = module.rds.db_instance_address
}

output "rds_cluster_id" {
    value = module.rds.db_instance_identifier
}

output "rds_cluster_db_name" {
    value = module.rds.db_instance_name
}

output "rds_cluster_master_username" {
    value = module.rds.db_instance_username
    sensitive = true
}

output "rds_cluster_master_password" {
    value = var.rds_password
    sensitive = true
}

output "rds_cluster_port" {
    value = module.rds.db_instance_port
}