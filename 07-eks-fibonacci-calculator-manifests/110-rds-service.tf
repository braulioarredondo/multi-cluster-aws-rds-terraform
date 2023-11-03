# Kubernetes Service Manifest (Type: Node Port Service)
resource "kubernetes_service_v1" "rds_service" {
  metadata {
    name = "rds"
  }
  spec {
    external_name = "${data.terraform_remote_state.rds.outputs.rds_cluster_endpoint}"
    port {
      name        = "http"
      port        = "${data.terraform_remote_state.rds.outputs.rds_cluster_port}"
      target_port = "${data.terraform_remote_state.rds.outputs.rds_cluster_port}"
    }
    type = "ExternalName"
  }
}