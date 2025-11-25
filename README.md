📌 📂 Project: GitHub Collaborator Access Checker

This project contains a shell script that helps you find users who have READ (pull) access to any GitHub repository.

It uses the GitHub REST API to fetch collaborator details and filters users based on their permissions.


Automation tasks

🚀 How the Script Works (Simple Explanation)

You provide:

GitHub username

GitHub Personal Access Token

Repository owner

Repository name

The script calls the GitHub API:

GET https://api.github.com/repos/<owner>/<repo>/collaborators


It uses jq (JSON parser) to filter users whose permissions contain:

permissions.pull == true


🛠️ Requirements

Before running the script, make sure you have:

✔ Linux or EC2 terminal
✔ curl installed

(Usually preinstalled)

✔ jq installed

Install it:

sudo apt install jq -y

✔ GitHub Personal Access Token

Generate from:
👉 https://github.com/settings/tokens

Enable these scopes:

repo

🧩 Environment Setup
1️⃣ Export your GitHub username
export username="YourGitHubUsername"

2️⃣ Export your GitHub token
export token="YOUR_GITHUB_TOKEN_HERE"

Verify:
echo $username
echo $token

▶️ How to Run the Script
Navigate to the script folder:
cd shell-scripting-projects/github-api

Give execute permission:
chmod +x list-users.sh

Run the script:
./list-users.sh <repo-owner> <repo-name>

Example (your repo):
./list-users.sh SahanaReddy06 my-repo

Example (public repo of someone else):
./list-users.sh torvalds linux

⭐ Script Output Examples
✔ If users have read access:
Listing users with read access to SahanaReddy06/my-repo...
Users with read access:
SahanaReddy06
developer1
admin2

✔ If no users have access:
No users with read access found for SahanaReddy06/my-repo.



📜 Script Explained (Line-by-Line Understanding)
Set API URL
API_URL="https://api.github.com"

Read environment variables
USERNAME=$username
TOKEN=$token

Inputs from terminal 
REPO_OWNER=$1
REPO_NAME=$2

Function: API GET call
github_api_get() {
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

Function: list users with read access
collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

If no users found
if [[ -z "$collaborators" ]]; then
    echo "No users with read access found..."

🎯 Summary

✔ This script checks who can READ a GitHub repo
✔ Works using GitHub API + jq
✔ Requires GitHub token
✔ Supports any repo (yours or public ones)
✔ Extremely useful for DevOps / security
