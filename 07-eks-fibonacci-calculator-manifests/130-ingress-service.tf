# Kubernetes Service Manifest (Type: Load Balancer)
resource "kubernetes_ingress_v1" "ingress" {
  metadata {
    name = "ingress-service"
    annotations = {
      "kubernetes.io/ingress.class"="nginx"
      "nginx.ingress.kubernetes.io/use-regex"="true"
      "nginx.ingress.kubernetes.io/rewrite-target"= "/$1"
    }    
  }

  spec {
    rule {
      http {
        path {
          backend {
            service {
              name = kubernetes_service_v1.server_service.metadata[0].name
              port {
                number = 5000
              }
            }
          }
          path = "/api/?(.*)"
          path_type = "Prefix"
        }
      }

       
    }
  
    rule {
      http {
        path {
          backend {
            service {
              name = kubernetes_service_v1.client_service.metadata[0].name
              port {
                number = 3000
              }
            }
          }
          path = "/?(.*)"
          path_type = "Prefix"
        }
      }

  }
}
}