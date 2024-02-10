#!/bin/bash
echo "Welcome to Get Started With Scalr On Google Cloud Platform"
read "What is your Scalr API token? " token
read "What is your account name? " account
read "What is your organization name? " organization
read "What is your Google Cloud project name?" project

echo "terraform {
  backend \"remote\" {
    hostname     = \"$account.scalr.io\"
    organization = \"$organization\"
    workspaces {
      name = \"scalr-get-started-gcp\"
    }
  }
}

provider \"google\" {
  project = \"$project\"
  region  = \"us-central1\"
  zone    = \"us-central1-c\"
}

resource \"google_compute_instance\" \"scalr\" {
  name         = \"terraform-instance\"
  machine_type = \"f1-micro\"

  boot_disk {
    initialize_params {
      image = \"debian-cloud/debian-9\"
    }
  }

  network_interface {
    network = \"default\"
    access_config {
    }
  }
}" > main.tf

echo "credentials \"$account.scalr.io\" {
  token = \"$token\"
}" >> ~/.terraformrc
