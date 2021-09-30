#!/bin/sh
#
# Passing in as command line arguments: 
#   1) A commit SHA hash
#   2) A version number to tag. e.g. vX.Y.Z
# 
# then
# 1) Tag the given commit with the given version number
# 2) Merge that tag into master
# 3) Merge that tag into develop

# Git directory
GIT_DIR=".git"

# Master branch
MASTER=master

# Develop branch
DEVELOP=develop

# Abort script if a command fails
set -e

# Get the name of the script
SCRIPT_NAME=`basename "$0"`

# Fail with an error
fail() {
    echo "$1" 1>&2
    exit 1
}

# Usage description if invalid arguments provided
usage() {
    fail "USAGE: ${SCRIPT_NAME} <commit> <version>" 
}

# Check command line argument count
if [ "$#" -ne 2 ]; then
    usage
fi

# Get commit hash from first command line argument
commit="$1"

# Get version number from second command line argument
version="$2"

# Check for Git repository
if [ ! -d "${GIT_DIR}" ]; then
    fail "Not a Git repository"
fi
  
# Print Git repository found
echo "Found Git repository: $(pwd)"

# Fetch without making changes
git fetch --dry-run

# Check commit exists
if ! git cat-file -e ${commit} 2> /dev/null ; then
  fail "Failed to find commit: ${commit}"
fi

# Check if tag already exists
if [ $(git tag -l "${version}") ]; then
    fail "Tag already exists: ${version}"
fi

# Prompt the user to confirm
read -r -p "Please confirm you would like to tag commit '${commit}' with version '${version}'? [y/N] " response
if [[ !("$response" =~ ^([yY][eE][sS]|[yY])$) ]]; then
    fail "Aborting..."
fi

# Tag the commit
git tag -a ${version} ${commit} -m "Release ${version}"

# Push the tag to the remote
git push --tags

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

