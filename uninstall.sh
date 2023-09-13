#!/usr/bin/env bash

#
# Script: uninstall.sh
# Usage: ./uninstall.sh
#
# Uninstalls the screxe executable from the user's path
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Path where the script is saved
PATH_DIR="/usr/local/bin"

# Name of the script saved to `PATH_DIR`
SCRIPT_NAME="screxe.sh"

# Name of the executable
EXECUTABLE_NAME="screxe"

# Remove the script from `PATH_DIR`
rm -rf "${PATH_DIR}/${SCRIPT_NAME}"

# Remove the executable from `PATH_DIR`
rm -rf "${PATH_DIR}/${EXECUTABLE_NAME}"

# Echo success
echo "Uninstall complete"
