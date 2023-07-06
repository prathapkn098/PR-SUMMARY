#!/bin/bash

# Set the necessary variables
OWNER="dokku"
REPO="dokku"
EMAIL_ADDRESS="prathapkn901@gmail.com"

# Set the API endpoint URL
API_URL="https://api.github.com/repos/${OWNER}/${REPO}/pulls?state=all"

# Function to retrieve pull request summary
retrieve_pull_request_summary() {
  # Make a GET request to the GitHub API and store the response in a variable
  response=$(curl -sSL ${API_URL})

  # Check if jq is installed
  if ! command -v jq >/dev/null 2>&1; then
    echo "jq command not found. Please install jq (https://stedolan.github.io/jq/) to run this script."
    exit 1
  fi

  # Extract the required information using jq and store the results in variables
  opened=$(jq '[ .[] | select(.state == "open") ] | length' <<< "$response")
  closed=$(jq '[ .[] | select(.state == "closed") ] | length' <<< "$response")
  draft=$(jq '[ .[] | select(.draft == true) ] | length' <<< "$response")

  # Print the pull request summary
  echo "Pull Request Summary:"
  echo "Opened: $opened"
  echo "Closed: $closed"
  echo "Draft: $draft"

  # Check if sendmail is installed
  if ! command -v sendmail >/dev/null 2>&1; then
    echo "sendmail command not found. Please install sendmail or use an alternative method to send emails."
    exit 1
  fi

  # Send the summary email
  echo "Opened: $opened, Closed: $closed, Draft: $draft" | sendmail $EMAIL_ADDRESS

  # Check the return status of sendmail
  if [ $? -eq 0 ]; then
    echo "Email sent successfully to $EMAIL_ADDRESS."
  else
    echo "Failed to send the email. Please check your email configuration."
  fi
}

# Call the function to retrieve the pull request summary and send the email
retrieve_pull_request_summary

