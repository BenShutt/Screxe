#!/usr/bin/env bash

#
# Script: find-fonts.sh
# Usage: ./find-fonts.sh <path/to/directory>
#
# Prints out the (.ttf) font files in the given directory
# as a list and as an XML for the Info.plist.
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Check the command-line argument is provided
if (( $# != 1 )); then
    echo "Please provide a directory as a command-line argument" 1>&2
    exit 1
fi

# Check the command-line argument is a directory 
if [[ ! -d "$1" ]]; then
    echo "$1 is not a valid directory" 1>&2
    exit 1
fi

# Get array of font files
IFS=$'\n'
files=($(find "$1" -type f -name '*.ttf' -exec basename {} \; | sort))
unset IFS

# Print the font files in a list
echo "==================== LIST ===================="
printf '%s\n' "${files[@]}"

# Print the font files as an XML for the Info.plist
echo "==================== XML ===================="
echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'
echo '<plist version="1.0">'
echo '<dict>'
echo '	<key>UIAppFonts</key>'
echo '	<array>'
printf '		<string>%s</string>\n' "${files[@]}"
echo '	</array>'
echo '</dict>'
echo '</plist>'