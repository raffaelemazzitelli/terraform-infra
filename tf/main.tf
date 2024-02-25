# terraform {
#   backend "remote" {
#     hostname     = "raffaelemazzitelli.scalr.io"
#     organization = "env-v0o8gki317e4cofst"
#     workspaces {
#       name = "scalr-get-started-gcp"
#     }
#   }
# }

provider "google" {
  project = "rare-phoenix-413915"
  region  = "europe-west1"
}

terraform {
  backend "gcs" {
    bucket  = "demo1-tfstate"
    prefix  = "terraform"
  }
}