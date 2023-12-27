# DELETE REPOSITORIES USING A POWERSHELL SCRIPT #

> [!WARNING]
> _Use this script with caution, deleting repositories is IRREVERSIBLE!_
>
> ## Ensure that you have a backup or are absolutely certain about the repositories to be deleted. ##


### Registration Steps:
1. **Create a GitHub Account:**
   - If you don't have a GitHub account, go to [GitHub](https://github.com/) and sign up for a new account.

2. **Install GitHub CLI (`gh`):**
   - Install GitHub CLI by following the instructions on the [official GitHub CLI installation page](https://cli.github.com/manual/installation).

### Authentication Steps:

1. **Authenticate with GitHub CLI:**
   - Open a terminal or command prompt and run:
     ```bash
     gh auth login
     ```
   - Follow the prompts to authenticate with your GitHub account.

2. **Refresh Authentication Token:**
   - If needed, refresh your authentication token with the required scope using:
     ```bash
     gh auth refresh -h github.com -s delete_repo
     ```

### Script to Delete Multiple Repositories:

1. **Create a Text File:**
   - Create a text file (`repos.txt`) with one repository name per line. For example:
     ```
     repo1
     repo2
     repo3
     ```

2. **PowerShell Script:**

```powershell
# File path containing the repository names
$filePath = "C:\Path\To\repos.txt"

# Read the names of the repositories from the file
$repos = Get-Content $filePath

# GitHub username
$githubUser = "YourGitHubUsername"

# Loop to delete each repository
foreach ($repo in $repos) {
    $urlRepo = "https://github.com/$githubUser/$repo"
    Write-Host "Deleting repository: $urlRepo"
    
    # Execute the command to delete the repository
    gh repo delete $urlRepo --yes
}
```

This PowerShell script is designed to delete multiple GitHub repositories listed in a text file (`repos.txt`). Let me explain each part:

- **`$filePath`:** This variable holds the file path where the repository names are listed. You need to replace `"C:\Path\To\repos.txt"` with the actual path to your text file.

- **`$repos`:** This variable is used to store the content of the file specified in `$filePath`. `Get-Content` is a PowerShell cmdlet used to read the content of a file.

- **`$githubUser`:** This variable represents your GitHub username. Replace `"YourGitHubUsername"` with your actual GitHub username.

- **`foreach ($repo in $repos) { ... }`:** This is a loop that iterates through each repository name read from the file.

- **`$urlRepo`:** This variable constructs the URL for each repository by combining the GitHub URL, your username, and the repository name.

- **`Write-Host "Deleting repository: $urlRepo"`:** This line outputs a message to the console indicating which repository is being deleted.

- **`gh repo delete $urlRepo --yes`:** This line executes the GitHub CLI (`gh`) command to delete the specified repository. The `--yes` flag is used to automatically confirm the deletion without prompting for confirmation.

When you run this script, it will go through each repository listed in `repos.txt`, construct the repository's URL, and delete it using the GitHub CLI.
