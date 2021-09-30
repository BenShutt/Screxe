#!/bash/sh

# Script to download, write, and run ${SCRIPT} removing it after.
# This allows the script to take user input while running.

# Name of script to download and run
SCRIPT="exe-tag-commit.sh"

# Remote script
REMOTE_URL="https://raw.githubusercontent.com/BenShutt/Screxe/master/Scripts/${SCRIPT}"

# Prepare clean up
function cleanup {
    rm -rf "${SCRIPT}"
}

# Abort script if a command fails
set -e

# Clean up on exit
trap cleanup EXIT

# Clean and recreate
cleanup

# Fetch and write remote script
curl -s "${REMOTE_URL}" -o "${SCRIPT}"

# Execute remote script
sh "${SCRIPT}"

