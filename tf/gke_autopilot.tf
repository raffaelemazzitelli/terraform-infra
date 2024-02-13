resource "google_container_cluster" "autopilot" {
  name     = "my-autopilot"
  location = google.region
  initial_node_count = 1
  enable_autopilot = true
  network = google_compute_network.default.self_link
  subnetwork = google_compute_subnetwork.default.self_link
}
