resource "kubernetes_secret" "pgpassword" {
  metadata {
    name = "pgpassword"
  }

  data = {
    PGUSER     = "${data.terraform_remote_state.rds.outputs.rds_cluster_master_username}"
    PGPASSWORD = "${data.terraform_remote_state.rds.outputs.rds_cluster_master_password}"
  }

  type = "kubernetes.io/basic-auth"
}