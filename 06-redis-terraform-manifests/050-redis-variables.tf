variable "redis_name" {
  description = "Name of the Redis cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "terraform-multi-k8s-redis"
}

variable "redis_cache_nodes" {
  description = "Number of Redis cache nodes for the clusters."
  type        = string
  default     = "1" #If you change this value, change 070-redis-outputs.tf  output.redis_endpoint
}

variable "redis_node_type" {
  description = "Redis cluster node class."
  type        = string
  default     = "cache.t2.micro"
}
