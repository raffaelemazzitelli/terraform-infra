terraform {
  backend "remote" {
    hostname     = "raffaelemazzitelli.scalr.io"
    organization = "acc-v0o8gki303f70aqin"
    workspaces {
      name = "scalr-get-started-gcp"
    }
  }
}

provider "google" {
  project = "rare-phoenix-413915"
  region  = "europe-west1"
}
