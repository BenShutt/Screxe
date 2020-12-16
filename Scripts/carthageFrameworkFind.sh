#!/bin/bash

# Directory of script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Directory where script is called from (present working directory)
PWD=$(pwd)

# Directory to search
SEARCH_DIR=$PWD/Carthage/Build/iOS

# Extension to filter on
EXT=framework

cd $SEARCH_DIR
for file in *.${EXT}; do
    echo $file
done
