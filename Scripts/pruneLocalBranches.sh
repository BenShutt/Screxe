#!/bin/bash -e

# Get present working directory
PWD=$(pwd)

# move to where this script was called from
echo "Pruning branches in ${PWD}"

# Run git prune
git fetch origin --prune

# Execute branch prune
#git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
git branch --v | grep "\[gone\]" | awk '{print $1}' | xargs git branch -d
