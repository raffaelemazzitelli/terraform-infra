resource "scalr_provider_configuration" "service-account" {
 name       = "google_main"
  account_id = "acc-116673111695431494013"
  google {
    project     = "rare-phoenix-413915"
    credentials = "admin"
  }
}