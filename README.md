# PR-SUMMARY SCRIPT
This script is designed to retrieve the summary of opened, closed, and draft pull requests from a specified GitHub repository and send the summary via email. It is a useful tool for monitoring pull request activity and keeping stakeholders informed about the status of pull requests.

Prerequisites
Before using this script, ensure that you have the following prerequisites in place:

jq: The script relies on the jq command-line tool for parsing JSON responses from the GitHub API. If jq is not already installed on your system, you can install it from the official website: https://stedolan.github.io/jq/. Make sure to install jq before proceeding.
Usage
To use the script, follow these steps:

Open the script file in a text editor.

Set the following variables at the beginning of the script:

OWNER: The owner of the GitHub repository. Replace dokku with the appropriate owner username.

REPO: The name of the GitHub repository. Replace dokku with the actual repository name.

EMAIL_ADDRESS: The email address where the summary email will be sent. Replace prathapkn901@gmail.com with the desired email address.

Save the script file.

Make the script file executable by running the following command in the terminal: chmod +x script.sh
Run the script by executing the following command in the terminal: ./script.sh
The script will retrieve the pull request summary from the specified GitHub repository and display it on the console. Additionally, it will attempt to send the summary email to the specified email address.
Note: The script uses the sendmail command to send the email. Please make sure that sendmail is installed and properly configured on your system. If sendmail is not available or you prefer to use an alternative email sending method, you can modify the script accordingly.
Example
Here is an example of how to use the script:
#!/bin/bash

# Set the necessary variables
OWNER="your-github-username"
REPO="your-github-repository"
EMAIL_ADDRESS="your-email@example.com"

# Set the API endpoint URL
API_URL="https://api.github.com/repos/${OWNER}/${REPO}/pulls?state=all"

# ... Rest of the script ...
Ensure to replace your-github-username, your-github-repository, and your-email@example.com with the appropriate values for your GitHub repository and email address.

By following these instructions and providing the necessary information, you can use this script to retrieve and send a summary of pull requests from your GitHub repository via email.

Please make sure that you have the required permissions and access to the specified GitHub repository and email address. If you encounter any issues or have any further questions, feel free to seek assistance or refer to the official documentation for the tools and services used in the script.
