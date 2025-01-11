#!/bin/bash
set -euo pipefail


git config --global core.autocrlf true

# Check if running in Git Bash
if [ -z "$BASH_VERSION" ]; then
    echo "This script should be run in Git Bash."
    exit 1
fi

# Define GIT_CONFIG_FILE
GIT_CONFIG_FILE="$HOME/.gitconfig"



if ! grep -q "path = $PWD/gitalias.txt" "$GIT_CONFIG_FILE" > /dev/null 2>&1; then
    git config --global include.path "$PWD/gitalias.txt"
    echo "Configured global git config include.path"
else
    echo "Global git config include.path is already configured"
fi

# Configure bash alias g=git
BASHRC_FILE="$HOME/.bashrc"
ALIAS_CONFIG="alias g='git'"

if ! grep -q "alias g='git'" "$BASHRC_FILE" > /dev/null 2>&1; then
    echo "$ALIAS_CONFIG" >> "$BASHRC_FILE"
    echo "Configured bash alias g=git"
else
    echo "bash alias g=git is already configured"
fi

echo "Installation complete. Please restart Git Bash for changes to take effect."
