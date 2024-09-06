# LTerm-Pro

## Overview

**LTerm-Pro** is an advanced Termux setup script designed to simplify and enhance the Termux experience. It helps users quickly install a wide range of essential tools, clone GitHub repositories, configure repositories, and set up storage. With detailed logging, error handling, and a customizable experience, this script is perfect for users who want to get the most out of Termux.

## Features

- **Automated Package Installation**: Choose from a wide selection of packages such as Nmap, Netcat, Wget, PHP, Curl, Python, Ruby, Node.js, and more.
- **Multiple Python Versions**: Install Python, Python2, and Python3 with one option.
- **GitHub Repository Cloning**: Automatically clone and set permissions for GitHub repositories like Termux-speak.
- **Termux Repository Configuration**: Ensures the latest mirrors are used to avoid outdated package issues.
- **Storage Setup**: Automatically configures Termux to access shared storage.
- **Detailed Logging**: All output is saved in `lterm-pro-install.log` for easy debugging.
- **Fun Mode**: Get a cheeky closing message by passing the `--fun` option when running the script.
- **Modular Installation**: Install individual tools as needed by selecting their corresponding number in the menu.
- **Error Handling**: Provides informative messages when something goes wrong, helping troubleshoot potential issues.
- **New Tools Added**: Now includes Zsh, Lynx (text-based browser), Midnight Commander (mc), and more.

## Prerequisites

Ensure you have Termux installed. You can get it from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or the [F-Droid](https://f-droid.org/packages/com.termux/) repository.

## Installation

To clone and use this script, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/YOUR_USERNAME/LTerm-Pro.git
    cd LTerm-Pro
    ```

2. Make the script executable:

    ```bash
    chmod +x lterm-pro.sh
    ```

3. Run the script:

    ```bash
    bash lterm-pro.sh
    ```

### Usage Options

- To display help information:

    ```bash
    bash lterm-pro.sh --help
    ```

- To enable fun mode (adds a casual closing message):

    ```bash
    bash lterm-pro.sh --fun
    ```

### Menu Options

When running the script, you'll be prompted to install any of the following tools:

- **Nmap**: Network exploration tool and security/port scanner.
- **Netcat**: Utility for reading from and writing to network connections.
- **Wget**: Network downloader.
- **PHP**: Server-side scripting language for web development.
- **Curl**: Tool for transferring data using URLs.
- **Python & Python2 & Python3**: Install all versions of Python.
- **Ruby**: A dynamic programming language.
- **lolcat**: Colorful rainbow output for terminal fun.
- **Termux-Speak**: Repository for text-to-speech integration.
- **Git**: Version control system.
- **OpenSSH**: Remote access via SSH.
- **Metasploit**: Security framework for penetration testing.
- **SQLmap**: Automatic SQL injection and database takeover tool.
- **htop**: Interactive process viewer.
- **Neofetch**: Command-line system information tool.
- **Node.js & npm**: JavaScript runtime and package manager.
- **Tmux**: Terminal multiplexer.
- **Termux API**: Access Android device functions from Termux.
- **YouTube-dl**: Download YouTube videos.
- **fzf**: Fuzzy finder.
- **Zsh**: Powerful shell similar to Bash.
- **Lynx**: Text-based web browser.
- **Midnight Commander (mc)**: Console file manager.

Simply select the tools you want by entering their corresponding numbers when prompted.

## Logging and Error Handling

All output from the script is logged in `lterm-pro-install.log`. In case something goes wrong, you can check this log file for details on what might have caused the issue.

## Fun Mode

By passing the `--fun` option when running the script, you'll get a lighthearted closing message once the installations are complete. For a more professional experience, run the script without the `--fun` flag.