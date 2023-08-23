#!/bin/bash

#
# removeXcode.sh
# Usage: ./removeXcode.sh
#
# Deletes Xcode from the file system
#

# Prompt user to confirm they want to execute this script
read -r -p "Are you sure you want to remove Xcode? [y/N] " response
if [[ !("$response" =~ ^([yY][eE][sS]|[yY])$) ]]; then
    echo "Aborting"
    exit 1
fi

# Execute
rm -rfv /Applications/Xcode.app
rm -rfv /Library/Preferences/com.apple.dt.Xcode.plist
rm -rfv ~/Library/Preferences/com.apple.dt.Xcode.plist
rm -rfv ~/Library/Caches/com.apple.dt.Xcode
rm -rfv ~/Library/Application Support/Xcode
rm -rfv ~/Library/Developer/Xcode
rm -rfv ~/Library/Developer/CoreSimulator
