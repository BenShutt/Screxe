#!/usr/bin/env bash

#
# Script: test-template-macros.sh
# Usage: ./test-template-macros.sh
#
# Test the template-macros.sh works successfully
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Path to the temporary swift package directory
TMP_DIR="/tmp/TmpSwiftPackage"

# Path to the generated file
PLIST_FILE="${TMP_DIR}/.swiftpm/xcode/package.xcworkspace/xcshareddata/IDETemplateMacros.plist"

# Prepare clean up
function cleanup {
    rm -rf "${TMP_DIR}"
}

# Clean up on exit
trap cleanup EXIT

# Clean and recreate
cleanup

# Make and move to tmp swift package directory
mkdir -p "${TMP_DIR}" && cd "${TMP_DIR}"

# Make a new swift package
swift package init

# Run script to generate the plist
bash -l -c "$(curl -sfL https://raw.githubusercontent.com/BenShutt/Screxe/master/Scripts/template-macros.sh)"

# Check the file exists
if ! [[ -f "${PLIST_FILE}}" ]]; then
    echo "Failed to find '${PLIST_FILE}' file" >&2
    exit 1
fi

# Print the file
echo "==================== Start ===================="
cat "${PLIST_FILE}"
echo "==================== End ===================="

# Log success
echo "Success"