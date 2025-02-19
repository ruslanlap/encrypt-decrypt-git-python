<div align="center">

# 🔐 CRYPTONIT

### Secure File Encryption Made Simple

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![OpenSSL](https://img.shields.io/badge/Security-OpenSSL-721412)](https://www.openssl.org/)

[Features](#-features) • [Quick Start](#-quick-start) • [Installation](#-installation) • [Usage](#-usage) • [Security](#-security)

</div>

---

## 🌟 Overview

CRYPTONIT is a powerful yet user-friendly file encryption tool that uses AES-256-CBC encryption to secure your sensitive files. With both interactive and command-line interfaces, it provides military-grade encryption with a simple user experience.

## 👍 Features

- 🔒 **Military-grade Security**: AES-256-CBC encryption with PBKDF2
- 🖥️ **Dual Interface**: Interactive and command-line modes
- 🎨 **Modern UI**: Colorful interface with progress indicators
- 🪚 **Auto-cleanup**: Secure handling of temporary files
- 🛠️ **Cross-platform**: Works on Linux, macOS, and Windows
- 🛡️ **Password Protection**: Secure password-based encryption
- 📁 **Smart Naming**: Automatic encrypted file management

## 📄 Table of Contents

- [Features](#-features)
- [Requirements](#-requirements)
- [Quick Install](#-quick-install)
- [Installation](#-installation)
- [Usage](#-usage)
- [Example](#-example)
- [Security Considerations](#-security-considerations)
- [How it Works](#-how-it-works)
- [encrypt.py](#encryptpy)
- [Disclaimer](#-disclaimer)

## 📆 Requirements

- Python 3.6 or higher
- OpenSSL library

## 🔄 Quick Install

```bash
# Latest Stable Version
curl -sSL https://raw.githubusercontent.com/ruslanlap/encrypt-decrypt-git-python/master/install.sh | bash

# Latest Test Version (with enhanced UI)
curl -sSL https://raw.githubusercontent.com/ruslanlap/encrypt-decrypt-git-python/test/install.sh | bash
```

## ⚙️ Installation

### Ubuntu/Debian

```sh
sudo apt update
sudo apt install openssl
```

### CentOS/RHEL

```sh
sudo yum install openssl
```

### macOS

```sh
brew install openssl
```

### Windows

For Windows, you can download OpenSSL binaries from the official OpenSSL website [here](https://www.openssl.org).

## 🔐 Security Features

- AES-256-CBC encryption algorithm
- PBKDF2 key derivation
- Secure password handling
- Automatic temporary file cleanup
- No password storage

## 🎯 Examples

### Basic Encryption

```bash
# Interactive Mode
cryptonit
> Choose operation: encrypt
> Enter file path: document.pdf
> Enter password: [hidden]
✅ Created: document.pdf_crypt

# Command Line Mode
cryptonit encrypt document.pdf
```

## 📝 Easy Usage

Just follow the workflow:

```sh
cryptonit
```

- 🔑 Enter password for AES-256-CBC encryption (or press Enter to use hardcoded)
- Choose the operation (encrypt/decrypt or e/d)
- Enter the input file name

## 💡 Example

Encrypt a file:

```sh
cryptonit
```

- 🔑 Enter password for AES-256-CBC encryption (password is hidden)
- Choose the operation (encrypt/decrypt or e/d): e
- Enter the input file name: my_secret_file.txt

This will encrypt the file `my_secret_file.txt` and create a new file named `my_secret_file.txt_crypt`.

## 📝 Alternative Usage

Add arguments after `./encrypt.sh` or `python encrypt.py`:

```sh
./encrypt.sh [encrypt|decrypt] <inputfile>
```

- `encrypt`: Encrypts the specified file.
- `decrypt`: Decrypts the specified file.
- `<inputfile>`: The path to the file you want to encrypt or decrypt.

### Example

Encrypt a file:

```sh
./encrypt.sh encrypt my_secret_file.txt
```

This will encrypt the file `my_secret_file.txt` and create a new file named `my_secret_file.txt_crypt`.

## 🔒 Security Considerations

- **Hardcoded Password**: This script includes a commented-out section for a hardcoded password. Do not use this option! Always prompt the user for a password at runtime.
- **Password Strength**: Choose a strong and unique password for encryption.
- **Script Permissions**: Ensure this script has appropriate permissions to be executed.

## 🔍 How it Works

1. The script prompts the user for a password for encryption.
2. It checks for at least two arguments (operation and input file).
3. Based on the operation (`encrypt`/`decrypt`):
   - **Encryption**:
     - Extracts the filename without the path.
     - Generates an output filename with the `_crypt` suffix.
     - Uses `openssl enc` with AES-256-CBC, salt, and PBKDF2 for password derivation.
   - **Decryption**:
     - Checks if the input filename ends with `_crypt`.
     - Generates an output filename by removing the `_crypt` suffix.
     - Uses `openssl enc -d` to decrypt the file.
4. The script displays a success or failure message based on the operation result.
5. Finally, it clears the password variable from memory for security reasons.

## 🐟 encrypt.py

The `encrypt.py` script offers the same functionality as the Bash script, enabling file encryption and decryption using the AES-256-CBC algorithm. It provides a Python-based alternative for users who prefer or require Python for their workflow.

### Usage

```sh
python encrypt.py [encrypt|decrypt] <inputfile>
```

- `encrypt`: Encrypts the specified file.
- `decrypt`: Decrypts the specified file.
- `<inputfile>`: The path to the file you want to encrypt or decrypt.

### Example

Encrypt a file:

```sh
python encrypt.py encrypt my_secret_file.txt
```

This will encrypt the file `my_secret_file.txt` and create a new file named `my_secret_file.txt_crypt`.

## ⚠️ Disclaimer

This tool is provided for educational and legitimate use only. Users are responsible for complying with local encryption laws and regulations.

Made with ❤️ by ruslanlap

