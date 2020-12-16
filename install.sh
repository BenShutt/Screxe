#!/bin/bash -e

#
# install.sh
# An install script for Screxe.
# 
# Usage: ./install.sh
# 

# Path to save the script
PATH=/usr/local/bin

# Name of the script to save to `PATH`
SCRIPT_NAME=screxe.sh

# Name of the remote repository
REMOTE_REPOSITORY_NAME=Screxe

# URL of the remote repository
REMOTE_URL=https://raw.githubusercontent.com/BenShutt/${REMOTE_REPOSITORY_NAME}/master

# Move to `PATH`
cd ${PATH}

# Download script into `PATH`
curl -fL --progress-bar "${REMOTE_URL}/${SCRIPT_NAME}"

# Make script executable
chmod +x ${SCRIPT_NAME}

