#!/usr/bin/env bash

#
# Script: youtube-dl.sh
# Usage: ./youtube-dl.sh
#
# Prompts for a YouTube URL and downloads it as an audio file (mp3) into the Music directory.
#

# Configure defaults
set -o nounset -o errexit -o errtrace -o pipefail

# ============================== Constants ==============================

# Directory to write audio file to
DESTINATION_DIRECTORY="${HOME}/Music"

# Github repository of youtube-dl
GITHUB_REPOSITORY="https://github.com/ytdl-org/youtube-dl"

# Command to run
COMMAND="youtube-dl"

# Audio format
AUDIO_FORMAT="mp3"

# Red color
RED='\033[0;31m'

# Green color
GREEN='\033[0;32m'

# Yellow color
YELLOW='\033[0;33m'

# No color
NC='\033[0m'

# ============================== Functions ==============================

# Print with red
function printRed {
    printf "${RED}$@${NC}\n"
}

# Print with green
function printGreen {
    printf "${GREEN}$@${NC}\n"
}

# Print with yellow
function printYellow {
    printf "${YELLOW}$@${NC}\n"
}

# Print with no color
function print {
    printf "${NC}$@${NC}\n"
}

# Print error message and exit with failure
function fatalError {
    printRed "$1" 1>&2
    exit 1
}

# Prompt the user for input.
# Returns the response string.
function prompt {
    local response
    read -r -p "$(printYellow $1) " response
    echo "${response}"
}

# Check input is not empty
function checkNotEmpty {
    if [ -z "$1" ]; then
        fatalError "Input can not be empty. Exiting..."
    fi
}

# ============================== Main ==============================

# Check youtube-dl is installed
if ! command -v ${COMMAND} &> /dev/null
then    
    fatalError "${COMMAND} command not found. Please install from ${GITHUB_REPOSITORY}."
fi

# Starting
print "Audio file will be written to ${DESTINATION_DIRECTORY}."

# Enter YouTube URL
youtubeUrl=$(prompt "Please enter a YouTube URL:")
checkNotEmpty "${youtubeUrl}"

# Destination
destination="${DESTINATION_DIRECTORY}/%(title)s.%(ext)s"

# Download the audio
${COMMAND} \
    --extract-audio \
    --audio-format ${AUDIO_FORMAT} \
    -o ${destination} \
    ${youtubeUrl} 

# Print success
printGreen "Success!"
