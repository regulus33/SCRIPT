# WARNING: this does not preserve the commit dates... its not that useful
#!/bin/bash

# Backup your repository before running this script!

# new author of all commits.
export GIT_AUTHOR_NAME="Zachary Rowden"
export GIT_AUTHOR_EMAIL="zacharyrowden89@gmail.com"

# Function to rewrite history
rewrite_history() {
    git rebase -r --root --exec "git commit --amend --no-edit --reset-author"
}

# Main execution
echo "Starting to rewrite history..."
rewrite_history
echo "History rewrite complete."

# Unset the temporary author details
unset GIT_AUTHOR_NAME
unset GIT_AUTHOR_EMAIL

# Reminder for pushing changes
echo "Don't forget to force push your changes to GitHub with: git push --force --tags origin 'refs/heads/*'"
