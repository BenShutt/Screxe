#!/usr/bin/env bash

#
# Script: template-macros.sh
# Usage: ./template-macros.sh
#
# Generates an IDETemplateMacros.plist file in the swift package
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Name of the file to generate
PLIST_FILE_NAME="IDETemplateMacros.plist"

# Remote URL to the template file
TEMPLATE_URL="https://raw.githubusercontent.com/BenShutt/Screxe/master/Resources/${PLIST_FILE_NAME}"

# (Relative) path to the Xcode workspace directory 
WORKSPACE_DIR="$(pwd)/.swiftpm/xcode/package.xcworkspace"

# Path to the Xcode shared data directory in the package
SHARED_DATA_DIR="${WORKSPACE_DIR}/xcshareddata"

# Path to the file to generate
PLIST_FILE="${SHARED_DATA_DIR}/${PLIST_FILE_NAME}"

# Check that we are in the root of a swift package directory
if [[ ! -d "${WORKSPACE_DIR}" ]]; then
    echo "Please run the script from the root of a Swift Package with a '${WORKSPACE_DIR}' directory." >&2
    exit 1
fi

# Get the name of the swift package
packageName="${PWD##*/}"  

# Make the shared data if it doesn't exist yet and move into it
mkdir -p "${SHARED_DATA_DIR}" && cd "${SHARED_DATA_DIR}"

# Download the template file
curl "${TEMPLATE_URL}" -o "${PLIST_FILE}"

# Replace package name
sed -i '' "s/{packageName}/${packageName}/g" "${PLIST_FILE}"

# Log success
echo "Generated file: '${PLIST_FILE}'"