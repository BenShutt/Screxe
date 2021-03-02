#!/bin/bash

# Name of Github user
USER_NAME="BenShutt"

# Name of the remote repository
REMOTE_REPOSITORY_NAME="Screxe"

# Name of remote branch
BRANCH_NAME="master"

# URL of the remote repository
REMOTE_URL="https://raw.githubusercontent.com/${USER_NAME}/${REMOTE_REPOSITORY_NAME}/${BRANCH_NAME}"

# File to read
FILE="Scripts/README.md"

# Print remote file
curl "${REMOTE_URL}/${FILE}"
