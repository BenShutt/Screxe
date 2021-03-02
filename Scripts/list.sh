#!/bin/bash

# Get the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Extension to filter on
EXT=sh

# Go to script directory
cd ${DIR}

# Enumerate files in directory with the required extension
for file in *.${EXT}; do
    echo $file
done
