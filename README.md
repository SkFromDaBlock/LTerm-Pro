# LTerm-Pro

## Overview
**LTerm-Pro** is an advanced Termux setup script designed for ease of use and customization. It helps users quickly install commonly used tools, clone GitHub repositories, and set up essential packages for Termux. The script also provides detailed logging, error handling, and a fun mode for the end message.

## Features

- **Automated package installation** (Nmap, Netcat, Wget, PHP, Curl, Python, etc.).
- **GitHub repository cloning** with permission setup for executables.
- **Termux repository configuration** to ensure the latest mirrors are used.
- **Logging**: All output is saved in `lterm-pro-install.log` for debugging.
- **Fun Mode**: Optionally get a cheeky closing message by passing `--fun` when running the script.

## Prerequisites

Make sure you have Termux installed. You can get it from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or the [F-Droid](https://f-droid.org/packages/com.termux/) repository.

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
- **Python & Python2**: Programming languages.
- **lolcat**: Colorful rainbow output for terminal (for fun!).
- **Termux-Speak**: Repository for text-to-speech integration.
- **Custom GitHub Repository**: Clone any GitHub repository and set permissions for executables.

Simply select the tools you want by entering their corresponding numbers when prompted.

### Example:
