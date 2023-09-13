#!/usr/bin/env bash

#
# Script: install.sh
# Usage: ./install.sh
#
# Installs the screxe.sh script as a screxe executable into the user's path
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Path to save the script
PATH_DIR="/usr/local/bin"

# Name of the script to save to `PATH_DIR`
SCRIPT_NAME="screxe.sh"

# Name of the executable
EXECUTABLE_NAME="screxe"

# URL of the remote repository
REMOTE_URL="https://raw.githubusercontent.com/BenShutt/Screxe/master"

# Exit if the target file already exists (as we will be removing a file we
# didn't download)
if test -f "${SCRIPT_NAME}"; then
    echo "${SCRIPT_NAME} already exists, can not execute script." >&2
    exit 1
fi

# Prepare clean up
function cleanup {
    rm -rf "${SCRIPT_NAME}"
}

# Execute clean up on exit
trap cleanup EXIT

# Download script into `PATH_DIR`
curl -O -L "${REMOTE_URL}/${SCRIPT_NAME}"

# Make script executable
chmod +x "${SCRIPT_NAME}"

# Uninstall previous
bash -l -c "$(curl -sfL ${REMOTE_URL}/uninstall.sh)"

# Move to `PATH_DIR`
mv "${SCRIPT_NAME}" "${PATH_DIR}/${EXECUTABLE_NAME}"

# Echo success
if [ $? -eq 0 ]; then
    echo "Install complete"
fi
