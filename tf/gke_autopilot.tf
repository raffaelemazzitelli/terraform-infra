resource "google_container_cluster" "autopilot" {
  name     = "my-autopilot"
  location = var.region
  initial_node_count = 1
  enable_autopilot = true
  network = google_compute_network.vpc.self_link
  subnetwork = google_compute_subnetwork.subnet.self_link
}
