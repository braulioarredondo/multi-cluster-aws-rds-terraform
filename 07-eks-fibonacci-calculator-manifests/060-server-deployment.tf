# Kubernetes Deployment Manifest
resource "kubernetes_deployment_v1" "server" {
  metadata {
    name = "server-deployment"
    labels = {
      component = "server"
    }
  } 
 
  spec {
    replicas = 2

    selector {
      match_labels = {
        component = "server"
      }
    }

    template {
      metadata {
        labels = {
          component = "server"
        }
      }

      spec {
        container {
          image = "braulioarredondo/multi-server-k8s-rds"
          name  = "server"
          port {
            container_port = 5000
          }
          env {
            name = "REDIS_HOST"
            value = "${data.terraform_remote_state.redis.outputs.redis_endpoint}"
          }
          env {
            name = "REDIS_PORT"
            value = "${data.terraform_remote_state.redis.outputs.redis_cluster_port}"
          }
          env {
            name = "PGUSER"
            value_from {
                      secret_key_ref {
                        name = kubernetes_secret.pgpassword.metadata[0].name
                        key = "PGUSER"
                                    }
                      }
          }
          env {
            name = "PGHOST"
            value = "${data.terraform_remote_state.rds.outputs.rds_cluster_endpoint}"
          }
          env {
            name = "PGPORT"
            value = "${data.terraform_remote_state.rds.outputs.rds_cluster_port}"
          }
          env {
            name = "PGDATABASE"
            value = "postgres"
          }
          env {
            name = "PGPASSWORD"
            value_from {
                      secret_key_ref {
                        name = kubernetes_secret.pgpassword.metadata[0].name
                        key = "PGPASSWORD"
                                    }
                      }
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

