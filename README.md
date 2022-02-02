# docker-demo

# Initialize the local directory as a Git repository.
## git init -b main

# Add the files in your new local repository. This stages them for the first commit.
## git add .
# Adds the files in the local repository and stages them for commit. To unstage a file, use 'git reset HEAD YOUR-FILE'.

## git commit -m "First commit"
# Commits the tracked changes and prepares them to be pushed to a remote repository. To remove this commit and modify the file, use 'git reset --soft HEAD~1' and commit and add the file again.


# Stage and commit all the files in your project
## git add . && git commit -m "initial commit"


## git fetch origin master
## git merge origin master