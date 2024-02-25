#!/bin/bash

# # Define the function
# output_env_base64_json() {
#   # Capture all environment variables, encode them in base64
#   local env_base64=$(env | base64 | tr -d '\n')

#   # Output the encoded environment variables in a JSON object
#   echo "{\"test\":\"${env_base64}\"}"
# }

# # Call the function
# output_env_base64_json | jq


dostuff() {
    gcloud container clusters get-credentials my-autopilot --region europe-west1 --project rare-phoenix-413915
    cat ~/.kube/config
}

local env_base64=$(gcloud auth list | base64 | tr -d '\n')
echo "{\"test\":\"${env_base64}\"}" | jq
