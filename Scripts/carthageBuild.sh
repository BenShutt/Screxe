#!/bin/bash -e

# Get the tag from the first command line argument.
# Check if a first argument is provided, other arguments will be ignored
if [ -z "$1" ]; then
    # Not argument provided
    echo "USAGE: $0 <tag>"
    exit 1
fi

# Tag passed in by command line argument
tag=$1

# Fetch tags from remote
git fetch --all --tags --prune

# Check if tag exists
tagExists=$(git tag -l "${tag}")
if [[ ! ${tagExists} ]]; then
    # Failed to find tag
    echo "Failed to find tag: '${tag}'"
    exit 1
fi

# Check user is happy to checkout the tag
read -r -p "Tag: '${tag}' found. This script will checkout that tag, would you like to continue? [y/N] " response
if [[ !("$response" =~ ^([yY][eE][sS]|[yY])$) ]]; then
    # User did not confirm tag checkout
    echo "Aborting."
    exit 1
fi


# Echo tag
echo "Running Carthage build to create framework for tag: '${tag}'"

# Checkout a tag
git checkout tags/${tag}

# Execute build
carthage build --archive
