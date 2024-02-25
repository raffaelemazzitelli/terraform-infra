#!/bin/bash

# Initialize variables for the environment variable values
google_app_credentials="${GOOGLE_APPLICATION_CREDENTIALS:-null}"
google_credentials="${GOOGLE_CREDENTIALS:-null}"

# Check if the variables should be null or hold a message for unset variables
if [ "$google_app_credentials" = "null" ]; then
    google_app_credentials_value="null"
else
    google_app_credentials_value="\"${google_app_credentials}\""
fi

if [ "$google_credentials" = "null" ]; then
    google_credentials_value="null"
else
    google_credentials_value="\"${google_credentials}\""
fi

# Generate JSON output
echo "{"
echo "  \"GOOGLE_APPLICATION_CREDENTIALS\": ${google_app_credentials_value},"
echo "  \"GOOGLE_CREDENTIALS\": ${google_credentials_value}"
echo "}" 
