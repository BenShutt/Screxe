#!/usr/bin/env bash

#
# Script: help.sh
# Usage: ./help.sh
#
# Prints the README.md of the scripts.
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Print remote file
curl "https://raw.githubusercontent.com/BenShutt/Screxe/master/Scripts/README.md"
