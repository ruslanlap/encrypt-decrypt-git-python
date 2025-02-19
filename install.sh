#!/bin/bash

# Check and install dos2unix if needed
if ! command -v dos2unix &> /dev/null; then
    echo "Installing dos2unix..."
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y dos2unix
    elif command -v yum &> /dev/null; then
        sudo yum install -y dos2unix
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y dos2unix
    elif command -v brew &> /dev/null; then
        brew install dos2unix
    else
        echo "Could not install dos2unix. Please install it manually."
        exit 1
    fi
fi

# Convert line endings to Unix format
dos2unix encrypt.sh 2>/dev/null || true
dos2unix install.sh 2>/dev/null || true

# Define variables
BINARY_NAME="cryptonit"
BINARY_URL="https://raw.githubusercontent.com/ruslanlap/encrypt-decrypt-git-python/test/encrypt.sh"
DESTINATION_DIR="$HOME/bin"
DESTINATION_PATH="$DESTINATION_DIR/$BINARY_NAME"

# Create destination directory
mkdir -p "$DESTINATION_DIR"

# Download the script and fix line endings using tr command
echo "Downloading '$BINARY_NAME'..."
curl -sSL "$BINARY_URL" | tr -d '\r' > "$DESTINATION_PATH"

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
