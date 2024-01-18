#!/usr/bin/env bash

#
# Script: pdf-images.sh
# Usage: ./pdf-images.sh
#
# Maps PNG and HEIC files to JPG then adds all JPG (& JPEG) images
# in the current directory into a PDF file using ImageMagick.
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Map file types with the given extension to JPG
function toJPG {
    query=$(find . -maxdepth 1 -mindepth 1 -type f -name "*.$1" | wc -c)
    count="$(($query))"
    if [ $count != 0 ]; then
        mogrify -format JPG "*.$1"
    fi
}

# Map PNG to JPG
toJPG "png"
toJPG "PNG"

# Map HEIC to JPG
toJPG "heic"
toJPG "HEIC"

# Make the PDF file
convert "*.{jpg,JPG,jpeg,JPEG}" -quality 100 Generated.pdf
