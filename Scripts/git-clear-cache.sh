#!/usr/bin/env bash

#
# Script: git-clear-cache.sh
# Usage: ./git-clear-cache.sh
#
# Clear the local git cache.
# https://stackoverflow.com/q/41863484
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Reset the git cache
git rm -r --cached .
git add .