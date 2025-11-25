# GitHub Collaborator Access Checker

This project contains a shell script that checks which GitHub users have **READ (pull) access** to a given repository.  
It uses the **GitHub REST API** and **jq** to fetch collaborator details and filter users based on permissions.

---

## 🚀 How the Script Works

1. You provide:
   - Your GitHub **username**
   - Your GitHub **Personal Access Token**
   - **Repository owner**
   - **Repository name**

2. The script calls:
https://api.github.com/repos/<owner>/<repo>/collaborators

3. It parses the JSON response using `jq`.

4. It filters users who have:
permissions.pull == true

5. It prints the list of users with read access.

---

## 🛠️ Requirements

- Linux terminal / EC2
- `curl`
- `jq`
- GitHub **Personal Access Token** with:
- `repo` permission

Install `jq` if needed:
```bash
sudo apt install jq -y
🧩 Setup Environment Variables
Set your GitHub username:

bash
Copy code
export username="YourGitHubUsername"
Set your GitHub token (no space around =):

bash
Copy code
export token="YOUR_GITHUB_TOKEN_HERE"
Verify environment variables:

bash
Copy code
echo $username
echo $token
▶️ How to Run the Script
Navigate to the script directory:

bash
Copy code
cd shell-scripting-projects/github-api
Give execute permissions:

bash
Copy code
chmod +x list-users.sh
Run the script:

bash
Copy code
./list-users.sh <repo-owner> <repo-name>
Example (your repository)
bash
Copy code
./list-users.sh SahanaReddy06 my-repo
Example (public repository)
bash
Copy code
./list-users.sh torvalds linux
⭐ Output Examples
✔ If users have read access:
bash
Copy code
Listing users with read access to SahanaReddy06/my-repo...
Users with read access:
SahanaReddy06
developer1
admin2
✔ If no users have read access:
pgsql
Copy code
No users with read access found for SahanaReddy06/my-repo.
📜 Script Breakdown (Simple Explanation)
API URL

bash
Copy code
API_URL="https://api.github.com"
Read environment variables

bash
Copy code
USERNAME=$username
TOKEN=$token
Command arguments

bash
Copy code
REPO_OWNER=$1
REPO_NAME=$2
GitHub API GET function

bash
Copy code
github_api_get() {
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}
Filter users with read access

bash
Copy code
jq -r '.[] | select(.permissions.pull == true) | .login'
🎯 Summary
Checks who has read access to a GitHub repository.

Uses GitHub API + jq.

Requires GitHub Personal Access Token.

Supports any public or private repo (you must have access).

Great for DevOps, security audits, and automation.
