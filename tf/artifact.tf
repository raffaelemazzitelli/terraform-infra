resource "google_artifact_registry_repository" "my-repo" {
  location      = var.region
  repository_id = "my-repository"
  description   = "example docker repository"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository_iam_member" "member" {
  project = google_artifact_registry_repository.my-repo.project
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/artifactregistry.reader"
  member = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}

resource "google_artifact_registry_repository_iam_member" "ci_cd_writer" {
  project = google_artifact_registry_repository.my-repo.project
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/artifactregistry.writer"
  member = "serviceAccount:${google_service_account.ci_cd_writer.email}"
}

resource "google_service_account" "ci_cd_writer" {
  account_id   = "ci-cd-writer"
  display_name = "Service Account"
}

