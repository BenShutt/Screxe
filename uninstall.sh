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

# Remove the script
rm -rf "${PATH_DIR}/screxe.sh"

# Remove the executable
rm -rf "${PATH_DIR}/screxe"

# Print success
echo "Uninstall success"
