#!/usr/bin/env bash

#
# Script: make-app-icon-images.sh
# Usage: ./make-app-icon-images.sh <path/to/app-store-icon.png>
# Arguments:
# - <path/to/app-store-icon.png>: A 1024x1024 app store image
#
# Generate the app icon images of various sizes from the 1024 app store image.
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# ============================== Constants ==============================

# Get directory path of this script
DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

# Directory to write app icon images to
OUTPUT_DIR="${DIR}/AppIconImages"

# ============================== Main ==============================

# Check a path to an image has been provided as argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path/to/app-store-icon.png>" 1>&2
    exit 1
fi

# Path to image to resize
imagePath="$1"

# Check that the image file exists
if [ ! -f "$imagePath" ]; then
    echo "No image file found at: $imagePath" 1>&2
    exit 1
fi

# Get name and extension of file
filename=$(basename -- "$imagePath")
extension="${filename##*.}"
filename="${filename%.*}"

# Resize the image to a given size. Arguments: <size> <scale>
function resize {
    if [ "$#" -ne 2 ]; then
        echo "Illegal number of arguments, require: <size> <scale>" 1>&2
        exit 1
    fi
    
    # Work out the "@Nx" suffix
    suffix="@$2x"
    if [ "$2" = 1 ]; then
        suffix=""
    fi
    
    # Determine values
    size=$(($1*$2))
    name=${filename}-${1}${suffix}.${extension}

    # Use ImageMagick to reize
    convert "${imagePath}" -resize "${size}x${size}" "${OUTPUT_DIR}/${name}"
}

# Make output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

# Resize to various sizes
resize 20 1
resize 20 2
resize 20 3

resize 29 1
resize 29 2
resize 29 3

resize 40 1
resize 40 2
resize 40 3

resize 60 2
resize 60 3

resize 76 1
resize 76 2

# Hardcode 83.5@2x case due to decimal
convert "${imagePath}" -resize 167x167 "$OUTPUT_DIR/${filename}-83.5@2x.${extension}"

# Copy main image
cp -f "${imagePath}" "${OUTPUT_DIR}"

# Print success
echo "Success! App icon images written to: ${OUTPUT_DIR}"
