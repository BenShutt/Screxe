#!/usr/bin/env bash

#
# Script: remove-xcode-derived-data.sh
# Usage: ./remove-xcode-derived-data.sh
#
# Removes the Xcode derived data directory.
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Remove directory
rm -rf "${HOME}/Library/Developer/Xcode/DerivedData"
