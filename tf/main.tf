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
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "scalr" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
