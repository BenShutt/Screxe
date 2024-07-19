#!/usr/bin/env bash

#
# Script: install.sh
# Usage: ./install.sh
#
# Installs the screxe.sh script as a screxe executable into the 
# user's path: /usr/local/bin
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Name of the script to download and write to the user's path
SCRIPT_NAME="screxe.sh"

# URL of the remote repository
REMOTE_URL="https://raw.githubusercontent.com/BenShutt/Screxe/master"

# Path to write file to
EXECUTABLE="/usr/local/bin/${SCRIPT_NAME%.*}"

# Exit if the executable file already exists (as we may be removing a file we
# did not download)
if [ -f "${EXECUTABLE}" ]; then
    echo "${EXECUTABLE} already exists, exiting..." 1>&2
    exit 1
fi

# Download script to destination
curl -H 'Cache-Control: no-cache' "${REMOTE_URL}/${SCRIPT_NAME}" -o "${EXECUTABLE}"

# Make script executable
chmod +x "${EXECUTABLE}"

# Print success
echo "Install success. Executable script written to ${EXECUTABLE}"
