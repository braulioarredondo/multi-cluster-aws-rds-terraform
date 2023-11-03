# Kubernetes Service Manifest (Type: Node Port Service)
resource "kubernetes_service_v1" "server_service" {
  metadata {
    name = "server-ip-service"
  }
  spec {
    selector = {
      component = kubernetes_deployment_v1.server.spec.0.selector.0.match_labels.component
    }
    port {
      name        = "http"
      port        = 5000
      target_port = 5000
    }
    type = "ClusterIP"
  }
}
