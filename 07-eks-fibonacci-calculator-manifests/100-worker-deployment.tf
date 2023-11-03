# Kubernetes Deployment Manifest
resource "kubernetes_deployment_v1" "worker" {
  metadata {
    name = "worker-deployment"
    labels = {
      component = "worker"
    }
  } 
 
  spec {
    replicas = 1

    selector {
      match_labels = {
        component = "worker"
      }
    }

    template {
      metadata {
        labels = {
          component = "worker"
        }
      }

      spec {
        container {
          image = "braulioarredondo/multi-worker-k8s-rds"
          name  = "worker"
          env {
            name = "REDIS_HOST"
            value = "${data.terraform_remote_state.redis.outputs.redis_endpoint}"
          }
          env {
            name = "REDIS_PORT"
            value = "${data.terraform_remote_state.redis.outputs.redis_cluster_port}"
          }
          env {
            name = "NODE_TLS_REJECT_UNAUTHORIZED"
            value = "0"
          }
          env {
            name = "DB_SSL__REJECT_UNAUTHORIZED"
            value = "false"
          }
          }
        }
      }
    }
}

