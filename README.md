
---

# Git Push Helper Scripts

This repository contains helper scripts to simplify the process of pushing changes to Git repositories. The provided scripts automate common tasks such as adding files, committing changes, and pushing to remote repositories.

## Bash Script: gitpush.sh

### Description:
The `gitpush.sh` script is written in Bash and provides a function `gitpush` to push changes to a Git repository. It automates the process of adding files, committing changes with a specified message, and pushing to the remote repository.

### Usage:
1. Clone or download this repository.
2. Open your `.bashrc` file:
   ```bash
   nano ~/.bashrc
   ```
3. Add the following line at the end of the file to source the script and make the `gitpush` function available:
   ```bash
   source /path/to/gitpush.sh
   ```
   Replace `/path/to/gitpush.sh` with the actual path to the `gitpush.sh` script on your system.
4. Save and close the `.bashrc` file.
5. Run the following command to apply the changes:
   ```bash
   source ~/.bashrc
   ```
6. Now you can use the `gitpush` function in your terminal to push changes to your Git repositories:
   ```bash
   gitpush "Your commit message"
   ```

## PowerShell Script: Git-Push.ps1

### Description:
The `Git-Push.ps1` script is written in PowerShell and provides a function `Git-Push` to push changes to a Git repository. It automates the process of adding files, committing changes with a specified message, and pushing to the remote repository.

### Usage:
1. Clone or download this repository.
2. Open your PowerShell profile file:
   ```powershell
   notepad $profile
   ```
3. Add the following line at the end of the file to import the script and make the `Git-Push` function available:
   ```powershell
   . /path/to/Git-Push.ps1
   ```
   Replace `/path/to/Git-Push.ps1` with the actual path to the `Git-Push.ps1` script on your system.
4. Save and close the PowerShell profile file.
5. Restart your PowerShell session or run the following command to apply the changes:
   ```powershell
   . $profile
   ```
6. Now you can use the `Git-Push` function in PowerShell to push changes to your Git repositories:
   ```powershell
   Git-Push -CommitMessage "Your commit message"
   ```

---

This README provides step-by-step instructions for users to configure and use the scripts by adding them to their `.bashrc` or PowerShell profile files.