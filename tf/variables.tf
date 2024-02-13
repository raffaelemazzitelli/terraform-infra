variable "project_id" {
  description = "project id"
  default = "rare-phoenix-413915"

}

variable "region" {
  description = "region"
  default = "europe-west1"
}

data "google_project" "project" {
  project_id = var.project_id
}
