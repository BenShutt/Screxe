#!/bin/bash -e
#
# screxe.sh
# Usage example: ./screxe.sh <scriptName>
#

# Name of the remote repository
REMOTE_REPOSITORY_NAME=Screxe

# URL of the remote repository (where scripts are hosted)
REMOTE_URL=https://raw.githubusercontent.com/BenShutt/${REMOTE_REPOSITORY_NAME}/master/Scripts

# Check if a first arugment is provided, other arguments will be ignored
if [ -z "$1" ]; then
    echo "USAGE: $0 <scriptName.sh>"
    exit 1
fi

# Fetch and execute the remote script
bash -l -c "$(curl -sfL ${REMOTE_URL}/$1)"
