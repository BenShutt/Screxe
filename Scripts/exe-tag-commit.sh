#!/bin/sh
#
# Usage: $ ./<script.sh> <commit> <version>
#
# Prompt the user to enter: 
#   1) A commit SHA hash
#   2) A version number to tag. e.g. vX.Y.Z
# 
# then:
# 1) Tag the given commit with the given version number
# 2) Merge that tag into master
# 3) Merge that tag into develop

# Abort script if a command fails
set -e

# Git directory
GIT_DIR=".git"

# Master branch
MASTER="master"

# Develop branch
DEVELOP="develop"

# Remote
ORIGIN="origin"

# Print error message and exit with failure
fatalError() {
    echo "$1" 1>&2
    exit 1
}

# Check for Git repository
if [ ! -d "${GIT_DIR}" ]; then
    fatalError "Please execute inside a Git repository"
fi
  
# Print Git repository found
echo "Found Git repository: $(pwd)"

# Fetch without making changes
git fetch --dry-run

# Get commit hash
read -p "Enter the commit (to tag): " commit

# Check commit exists
if ! git cat-file -e ${commit} 2> /dev/null ; then
    fatalError "Failed to find commit: '${commit}'"
fi

# Get version number
read -p "Enter the version (e.g. vX.Y.Z): " version

# Check if tag already exists
if [ $(git tag -l "${version}") ]; then
    fatalError "Tag already exists: '${version}'"
fi

# Prompt the user to confirm
read -r -p "Please confirm you would like to tag commit '${commit}' with version '${version}'? [y/N] " response
if [[ !("$response" =~ ^([yY][eE][sS]|[yY])$) ]]; then
    fatalError "Aborting..."
fi

# Tag the commit
git tag ${version} ${commit}

# Push the tag to the remote
git push ${ORIGIN} ${version}

# Prompt user to confirm they want to merge into master
read -r -p "Would you like to merge ${version} into ${MASTER}? [y/N] " response
if [[ ("$response" =~ ^([yY][eE][sS]|[yY])$) ]]; then
    git checkout ${MASTER}
    git merge ${version}
    git push
fi

# Prompt user to confirm they want to merge into develop
read -r -p "Would you like to merge ${version} into ${DEVELOP}? [y/N] " response
if [[ ("$response" =~ ^([yY][eE][sS]|[yY])$) ]]; then
    git checkout ${DEVELOP}
    git merge ${version}
    git push
fi

