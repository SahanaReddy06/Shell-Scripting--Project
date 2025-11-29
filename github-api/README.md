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

---


sudo apt install jq -y

git clone https://SahanaReddy06/Shell-Scripting--Project

---

🧩 How to Run the Script

Set your GitHub username and tokens:

export username="YourGitHubUsername"

export token="YOUR_GITHUB_TOKEN_HERE"

Verify environment variables:

echo $username

echo $token

Navigate to the script directory:

cd shell-scripting-projects/github-api

Give execute permissions:

chmod +x list-users.sh

Run the script:

./list-users.sh <repo-owner> <repo-name>

Example (your repository)

/list-users.sh SahanaReddy06 my-repo

Example (public repository)

./list-users.sh torvalds linux

---

🎯 Summary
Checks who has read access to a GitHub repository.

Uses GitHub API + jq.

Requires GitHub Personal Access Token.

Supports any public or private repo (you must have access).

Great for DevOps, security audits, and automation.
