#!/bin/bash -e

#
# install.sh
# An install script for Screxe.
# 
# Usage: ./install.sh
# 

# Path to save the script
PATH_DIR=/usr/local/bin

# Name of the script to save to `PATH_DIR`
SCRIPT_NAME=screxe.sh

# Name of the executable
EXECUTABLE_NAME=screxe

# Name of Github user
USER_NAME=BenShutt

# Name of the remote repository
REMOTE_REPOSITORY_NAME=Screxe

# Name of remote branch
BRANCH_NAME=master

# URL of the remote repository
REMOTE_URL=https://raw.githubusercontent.com/${USER_NAME}/${REMOTE_REPOSITORY_NAME}/${BRANCH_NAME}

# Exit if the target file already exists (as we will be removing a file we
# didn't download)
if test -f "${SCRIPT_NAME}"; then
    echo "${SCRIPT_NAME} already exists, can not execute script."
    exit 1
fi

# Prepare clean up
function cleanup {
    rm -rf ${SCRIPT_NAME}
}

# Execute clean up on exit
trap cleanup EXIT

# Download script into `PATH_DIR`
curl -O -L "${REMOTE_URL}/${SCRIPT_NAME}"

# Make script executable
chmod +x ${SCRIPT_NAME}

# Uninstall previous
bash -l -c "$(curl -sfL ${REMOTE_URL}/uninstall.sh)"

# Move to `PATH_DIR`
mv ${SCRIPT_NAME} ${PATH_DIR}/${EXECUTABLE_NAME}

# Echo success
if [ $? -eq 0 ]; then
    echo "Install complete"
fi
