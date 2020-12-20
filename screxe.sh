#!/bin/bash -e
#
# screxe.sh
# Usage example: ./screxe.sh <scriptName>
#

# Name of Github user
USER_NAME=BenShutt

# Name of the remote repository
REMOTE_REPOSITORY_NAME=Screxe

# Name of remote branch
BRANCH_NAME=master

# URL of the remote repository
REMOTE_URL=https://raw.githubusercontent.com/${USER_NAME}/${REMOTE_REPOSITORY_NAME}/${BRANCH_NAME}

# Check if a first argument is provided, other arguments will be ignored
if [ -z "$1" ]; then
    echo "USAGE: $0 <scriptName.sh>"
    exit 1
fi

# Fetch and execute the remote script
bash -l -c "$(curl -sfL ${REMOTE_URL}/$1)"
