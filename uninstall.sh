#!/bin/bash -e

#
# uninstall.sh
# An uninstall script for Screxe.
# 
# Usage: ./uninstall.sh
# 

# Path where the script is saved
PATH_DIR=/usr/local/bin

# Name of the script saved to `PATH_DIR`
SCRIPT_NAME=screxe.sh

# Remove the script from `PATH_DIR`
rm -rf "${PATH_DIR}/${SCRIPT_NAME}"

