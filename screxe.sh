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

# Name of the folder where scripts are located
FOLDER_NAME=Scripts

# URL of the remote repository
REMOTE_URL=https://raw.githubusercontent.com/${USER_NAME}/${REMOTE_REPOSITORY_NAME}/${BRANCH_NAME}/${FOLDER_NAME}

# Extension for shell script
SCRIPT_EXTENSION=sh

# Check if a first argument is provided, other arguments will be ignored
if [ -z "$1" ]; then
    echo "USAGE: $0 <scriptName.sh>"
    exit 1
fi

# Name of the script to execute
scriptName=$1

# Extension of `scriptName`
extension="${scriptName##*.}"

# Suffix `SCRIPT_EXTENSION` extension to `scriptName` if it doesn't exist
if [[ ${extension} != ${SCRIPT_EXTENSION} ]]; then
    scriptName="${scriptName}.${SCRIPT_EXTENSION}"
fi

# URL to fetch
url=${REMOTE_URL}/${scriptName}

# Fetch script
curl -f ${url} >/dev/null 2>&1

# Check curl
exit_status=$?
if [ $exit_status != 0 ]; then
    echo "Failed to find script: ${scriptName}"
    exit $exit_status
fi

# Echo running
echo "Running script: ${scriptName}..."

# Fetch and execute the remote script
bash -l -c "$(curl -sfL ${url})"
