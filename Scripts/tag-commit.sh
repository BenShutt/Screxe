#!/usr/bin/env bash

#
# Script: tag-commit.sh
# Usage: ./tag-commit.sh
#
# Script to download, write, and run ${SCRIPT} removing it after.
# This allows the script to take user input while running.
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Name of script to download and run
SCRIPT="exe-tag-commit.sh"

# Remote script
REMOTE_URL="https://raw.githubusercontent.com/BenShutt/Screxe/master/Scripts/${SCRIPT}"

# Prepare clean up
function cleanup {
    rm -rf "${SCRIPT}"
}

# Clean up on exit
trap cleanup EXIT

# Clean and recreate
cleanup

# Fetch and write remote script
curl -s -H 'Cache-Control: no-cache' "${REMOTE_URL}" -o "${SCRIPT}"

# Execute remote script
sh "${SCRIPT}"
