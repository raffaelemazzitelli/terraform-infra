resource "google_iam_workload_identity_pool" "ci_ci" {
  workload_identity_pool_id = "ci_ci"
}

resource "google_iam_workload_identity_pool_provider" "ci_ci" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.ci_ci.workload_identity_pool_id
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
