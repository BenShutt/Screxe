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

# Name of the remote repository
REMOTE_REPOSITORY_NAME=Screxe

# URL of the remote repository
REMOTE_URL=https://raw.githubusercontent.com/BenShutt/${REMOTE_REPOSITORY_NAME}/master

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

# Move to `PATH_DIR`
mv ${SCRIPT_NAME} ${PATH_DIR}

