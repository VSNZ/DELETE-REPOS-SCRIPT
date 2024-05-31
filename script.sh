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
