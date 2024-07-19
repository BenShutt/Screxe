#!/usr/bin/env bash

#
# Script: screxe.sh
# Usage: ./screxe.sh <scriptName>
#
# Executes the remote script with the given name.
# The "sh" path extension will be appeneded if not provided.
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# URL of the remote repository directory of scripts
REMOTE_URL="https://raw.githubusercontent.com/BenShutt/Screxe/master/Scripts"

# Extension for a shell script
SCRIPT_EXTENSION="sh"

# Ensure a first argument is provided, other arguments will be ignored
if [ "$#" -eq 0 ] || [ "$1" == "" ]; then
    echo "Usage: $0 <scriptName.sh>" 1>&2
    exit 1
fi

# Name of the script to execute
scriptName="$1"

# Extension of scriptName
extension="${scriptName##*.}"

# Suffix path extension to scriptName if it doesn't exist
if [[ ${extension} != ${SCRIPT_EXTENSION} ]]; then
    scriptName="${scriptName}.${SCRIPT_EXTENSION}"
fi

# URL to fetch
url="${REMOTE_URL}/${scriptName}"

# Check if remote URL exists, if so fetch and execute the remote script
if curl -sfI "${url}" -o /dev/null; then
    echo "Running script: ${scriptName}..."
    bash -l -c "$(curl -sf ${url})"
else
    echo "Failed to find script: ${scriptName}" 1>&2
    exit 1
fi
