#!/bin/bash

# Backup your repository before running this script!

# The email you want to change FROM (your work email)
GIT_EMAIL="your_work_email@example.com"

# The name and email you want to change TO (your personal details)
CORRECT_NAME="Zachary Rowden"
CORRECT_EMAIL="zacharyrowden89@gmail.com"

# Function to rewrite history
rewrite_history() {
    git filter-branch --env-filter '
    OLD_EMAIL="$GIT_EMAIL"
    CORRECT_NAME="$CORRECT_NAME"
    CORRECT_EMAIL="$CORRECT_EMAIL"

    if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_COMMITTER_NAME="$CORRECT_NAME"
        export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
    fi
    if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_AUTHOR_NAME="$CORRECT_NAME"
        export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
    fi
    ' --tag-name-filter cat -- --branches --tags
}

# Main execution
echo "Starting to rewrite history..."
rewrite_history
echo "History rewrite complete."

# Reminder for pushing changes
echo "Don't forget to force push your changes to GitHub with: git push --force --tags origin 'refs/heads/*'"
