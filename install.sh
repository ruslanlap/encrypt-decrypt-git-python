#!/bin/bash

# Convert line endings to Unix format (LF)
dos2unix encrypt.sh
dos2unix install.sh

# Define variables
BINARY_NAME="cryptonit"
BINARY_URL="https://raw.githubusercontent.com/ruslanlap/encrypt-decrypt-git-python/test/encrypt.sh"
DESTINATION_DIR="$HOME/bin"
DESTINATION_PATH="$DESTINATION_DIR/$BINARY_NAME"

# Create destination directory
mkdir -p "$DESTINATION_DIR"

# Download the script
echo "Downloading '$BINARY_NAME'..."
curl -sSLo "$DESTINATION_PATH" "$BINARY_URL"

# Make the script executable
chmod +x "$DESTINATION_PATH"

# Add to PATH if needed
if ! echo "$PATH" | grep -q "$HOME/bin"; then
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    echo "Added $HOME/bin to PATH"
fi

echo "✅ Installation complete! You can now use the 'cryptonit' command."
echo "Please restart your terminal or run: source ~/.bashrc"
