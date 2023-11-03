#REDIS Outups
output "redis_endpoint" {
    #This will work only with 1 elasticache node
    #value = aws_elasticache_cluster.redis_cluster.cache_nodes
    value = aws_elasticache_cluster.redis_cluster.cache_nodes[0].address
  }

output "redis_cluster_port" {
    value = aws_elasticache_cluster.redis_cluster.port
}

output "redis_cluster_arn" {
    value = aws_elasticache_cluster.redis_cluster.arn
}