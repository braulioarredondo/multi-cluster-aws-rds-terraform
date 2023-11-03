# Kubernetes Service Manifest (Type: Node Port Service)
resource "kubernetes_service_v1" "client_service" {
  metadata {
    name = "client-ip-service"
  }
  spec {
    selector = {
      component = kubernetes_deployment_v1.client.spec.0.selector.0.match_labels.component
    }
    port {
      name        = "http"
      port        = 3000
      target_port = 3000
    }
    type = "ClusterIP"
  }
}
