resource "kubernetes_secret" "pgpassword" {
  metadata {
    name = "pgpassword"
  }

  data = {
    username     = "${data.terraform_remote_state.rds.outputs.rds_cluster_master_username}"
    password = "${data.terraform_remote_state.rds.outputs.rds_cluster_master_password}"
  }

  type = "kubernetes.io/basic-auth"
}