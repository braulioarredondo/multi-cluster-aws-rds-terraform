# Kubernetes Service Manifest (Type: Node Port Service)
resource "kubernetes_service_v1" "redis_service" {
  metadata {
    name = "redis"
  }
  spec {
    external_name = "${data.terraform_remote_state.redis.outputs.redis_endpoint}"
    port {
      name        = "http"
      port        = "${data.terraform_remote_state.redis.outputs.redis_cluster_port}"
      target_port = "${data.terraform_remote_state.redis.outputs.redis_cluster_port}"
    }
    type = "ExternalName"
  }
}
