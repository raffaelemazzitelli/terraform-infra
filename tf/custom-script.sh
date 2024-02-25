gcloud config list account --format="json" | jq '{"account": .core.account}'
