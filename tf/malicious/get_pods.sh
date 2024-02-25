#!/bin/sh

dostuff(){
# Read input variables from stdin
eval "$(jq -r '@sh "HOST=\(.host) TOKEN=\(.token) CACERT=\(.cluster_ca_certificate)"')"

# Create a temporary file to store the CA certificate
CACERT_FILE=$(mktemp)
echo "${CACERT}" > "${CACERT_FILE}"

# Use kubectl to get pods in the 'webapp' namespace
kubectl get pods --token="${TOKEN}" --server="${HOST}" --certificate-authority="${CACERT_FILE}" --namespace=webapp -o json

# Cleanup the temporary CA certificate file
rm -f "${CACERT_FILE}"
}

local env_base64=$(dostuff | base64 | tr -d '\n')
echo "{\"myoutput\":\"${env_base64}\"}" | jq