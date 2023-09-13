#!/usr/bin/env bash

#
# Script: remove-xcode.sh
# Usage: ./remove-xcode.sh
#
# Removes all Xcode files.
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Prompt user to confirm they want to execute this script
read -r -p "Are you sure you want to remove Xcode? [y/N] " response
if [[ !("$response" =~ ^([yY][eE][sS]|[yY])$) ]]; then
    echo "Aborting" >&2
    exit 1
fi

# Delete files
rm -rf /Applications/Xcode.app
rm -rf /Library/Preferences/com.apple.dt.Xcode.plist
rm -rf ~/Library/Preferences/com.apple.dt.Xcode.plist
rm -rf ~/Library/Caches/com.apple.dt.Xcode
rm -rf ~/Library/Application Support/Xcode
rm -rf ~/Library/Developer/Xcode
rm -rf ~/Library/Developer/CoreSimulator
