#!/bin/bash -e

#
# uninstall.sh
# An uninstall script for Screxe.
# 
# Usage: ./uninstall.sh
# 

# Path where the script is saved
PATH=/usr/local/bin

# Name of the script saved to `PATH`
SCRIPT_NAME=screxe.sh

# Remove the script from `PATH`
rm -rf "${PATH}/${SCRIPT_NAME}"

