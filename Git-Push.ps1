function Git-Push {
    param(
        [string]$CommitMessage,
        [string]$GithubUsername = $env:GITHUB_USERNAME,
        [string]$GithubToken = $env:GITHUB_TOKEN
    )

    # Check if a commit message is provided
    if (-not $CommitMessage) {
        Write-Host "Please provide a commit message."
        return
    }

    # Check if GitHub username is set
    if (-not $GithubUsername) {
        Write-Host "GitHub username is not set."
        $GithubUsername = Read-Host "Enter your GitHub username"
        if (! $GithubUsername) {
            Write-Error "Something went wrong, plz try again"
            return 0
        }
        setx GITHUB_USERNAME "$GithubUsername"
    }

    # Check if GitHub token is set
    if (-not $GithubToken) {
        Write-Host "GitHub token is not set."
        $GithubToken = Read-Host "Enter your GitHub token"
        if (! $GithubToken) {
            Write-Error "Something went wrong, plz try again"
            return 0
        }
        setx GITHUB_TOKEN "$GithubToken"
    }

    
    # Check if .git folder exists in the current directory
    $GitFolderPath = Get-Location
    if (-not (Test-Path -Path (Join-Path -Path $GitFolderPath -ChildPath ".git"))) {
        Write-Host "Git repository not found in the current directory."
        return
    }

    # Read repository name from .git/config file
    $ConfigPath = Join-Path -Path $GitFolderPath -ChildPath ".git\config"
    $Repository = $null

    $content = Get-Content $ConfigPath

    foreach ($line in $content) {
        if ($line -match "url = .+/(.+)\.git") {
            $Repository = $matches[1]
            break
        }
    }

    # If repository name is not found, exit
    if (-not $Repository) {
        Write-Host "Repository name not found."
        return
    }

    # Build URL with username/token and repository name
    $Url = "https://$GithubUsername`:$GithubToken@github.com/$GithubUsername/$Repository"

    # Execute Git commands
    git add .
    git commit -m $CommitMessage 
    git push $Url
}