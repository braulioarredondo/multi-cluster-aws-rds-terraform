#REDIS Cluster

#Subnet Group
resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "${local.name}-${var.redis_name}-subnet-group"
  subnet_ids = data.terraform_remote_state.eks.outputs.private_subnets
}

#Redis Cluster
resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = "${local.name}-${var.redis_name}"
  engine               = "redis"
  node_type            = var.redis_node_type
  num_cache_nodes      = var.redis_cache_nodes
  parameter_group_name = "default.redis7"
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids   = [data.terraform_remote_state.eks.outputs.cluster_primary_security_group_id]
}