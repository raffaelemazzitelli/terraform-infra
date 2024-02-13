resource "google_iam_workload_identity_pool" "ci_cd" {
  workload_identity_pool_id = "ci-cd"
}

resource "google_iam_workload_identity_pool_provider" "ci_cd" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.ci_cd.workload_identity_pool_id
  workload_identity_pool_provider_id = "circleci-oidc"
  
  attribute_mapping = {
    "google.subject" = "assertion.sub"
    "attribute.project" = "assertion['oidc.circleci.com/project-id']"
  }

  oidc {
    allowed_audiences = ["51ee2747-f8c7-4790-8b4a-9ee20c7102a1"]
    issuer_uri        = "https://oidc.circleci.com/org/51ee2747-f8c7-4790-8b4a-9ee20c7102a1"
  }
}


resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = google_service_account.ci_cd_writer.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/projects/869209469704/locations/global/workloadIdentityPools/ci-cd/*",
  ]
}


