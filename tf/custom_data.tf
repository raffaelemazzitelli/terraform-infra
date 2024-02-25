data "external" "test" {
  program = ["sh", "${path.module}/custom-script.sh", "${data.google_container_cluster.my_cluster.master_auth[0].token}"]
}

output "output-test" {
  value = data.external.test
}

data "google_container_cluster" "my_cluster" {
  name     = "my-autopilot"
  location = var.region
}