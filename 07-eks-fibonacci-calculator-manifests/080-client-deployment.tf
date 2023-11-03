# Kubernetes Deployment Manifest
resource "kubernetes_deployment_v1" "client" {
  metadata {
    name = "client-deployment"
    labels = {
      component = "web"
    }
  } 
 
  spec {
    replicas = 2

    selector {
      match_labels = {
        component = "web"
      }
    }

    template {
      metadata {
        labels = {
          component = "web"
        }
      }

      spec {
        container {
          image = "braulioarredondo/multi-client-k8s-rds"
          name  = "client"
          port {
            container_port = 3000
          }
          }
        }
      }
    }
}

