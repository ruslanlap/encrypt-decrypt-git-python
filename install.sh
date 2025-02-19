#!/bin/bash

# Define variables
BINARY_NAME="cryptonit"
BINARY_URL="https://raw.githubusercontent.com/ruslanlap/encrypt-decrypt-git-python/test/encrypt.sh"
DESTINATION_DIR="$HOME/bin"
DESTINATION_PATH="$DESTINATION_DIR/$BINARY_NAME"

# Create destination directory
mkdir -p "$DESTINATION_DIR"

# Download the script and ensure Unix line endings
echo "Downloading '$BINARY_NAME'..."
curl -sSL "$BINARY_URL" | sed 's/\r$//' > "$DESTINATION_PATH"

# Make the script executable
chmod +x "$DESTINATION_PATH"

# Add to PATH if needed
if ! echo "$PATH" | grep -q "$HOME/bin"; then
    if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
        echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
        source "$HOME/.bashrc"
        echo "Added to bash configuration"
    elif [ -n "$ZSH_VERSION" ] && [ -f "$HOME/.zshrc" ]; then
        echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.zshrc"
        source "$HOME/.zshrc"
        echo "Added to zsh configuration"
    else
        echo "Could not detect shell configuration"
        echo "Please add $HOME/bin to your PATH manually"
    fi
fi

echo "✅ Installation complete! You can now use the 'cryptonit' command."
