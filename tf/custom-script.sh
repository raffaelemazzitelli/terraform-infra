#!/bin/bash

# Define the function
output_env_base64_json() {
  # Capture all environment variables, encode them in base64
#   local env_base64=$(env | base64 | tr -d '\n')
  local env_base64=$(gcloud iam service-accounts list | base64 | tr -d '\n')

  # Output the encoded environment variables in a JSON object
  echo "{\"test\":\"${env_base64}\"}"
}

# Call the function
output_env_base64_json | jq
