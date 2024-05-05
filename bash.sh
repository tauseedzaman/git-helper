    function gitpush {
        commit_message=$1
        github_username=$GITHUB_USERNAME
        github_token=$GITHUB_TOKEN

        # Check if a commit message is provided
        if [ -z "$commit_message" ]; then
            echo "Please provide a commit message."
            return 1
        fi

        # Check if GitHub username is set
        if [ -z "$github_username" ]; then
            echo "GitHub username is not set."
            read -p "Enter your GitHub username: " github_username
            export GITHUB_USERNAME=$github_username
        fi

        # Check if GitHub token is set
        if [ -z "$github_token" ]; then
            echo "GitHub token is not set."
            read -p "Enter your GitHub token: " -s github_token
            export GITHUB_TOKEN=$github_token
        fi

        # Check if .git folder exists in the current directory
        if [ ! -d ".git" ]; then
            echo "Git repository not found in the current directory."
            return 1
        fi

        # Read repository name from .git/config file
        repository=$(git config --get remote.origin.url | grep -oP '.*/\K[^/]*(?=\.git)')

        # If repository name is not found, exit
        if [ -z "$repository" ]; then
            echo "Repository name not found."
            return 1
        fi

        # Build URL with username/token and repository name
        url="https://$github_username:$github_token@github.com/$github_username/$repository"

        # Execute Git commands
        git add . || { echo "Failed to add files."; return 1; }
        git commit -m "$commit_message" || { echo "Failed to commit changes."; return 1; }
        git push "$url" || { echo "Failed to push changes."; return 1; }
    }
