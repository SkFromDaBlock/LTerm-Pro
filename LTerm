#!/bin/bash

# --- Define colors for output ---
RED='\033[1;91m'
GREEN='\033[1;92m'
YELLOW='\033[1;93m'
BLUE='\033[1;94m'
PURPLE='\033[1;95m'
CYAN='\033[1;96m'
WHITE='\033[1;97m'
NC='\033[0m'  # No Color

# --- Define log file for debugging ---
LOG_FILE="lterm-pro-install.log"
exec > >(tee -i $LOG_FILE)
exec 2>&1

# --- Help flag for usage guidance ---
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo -e "${CYAN}Usage: bash script_name.sh${NC}"
    echo -e "Follow the prompts to install the desired tools."
    echo -e "You can also use '--fun' for a more casual final message."
    exit 0
fi

# --- Header for user-friendly interface ---
echo -e "${RED}=========================================="
echo -e "            LTerm-Pro"
echo -e "==========================================${NC}"

# --- Function to install packages ---
install_pkg() {
    PKG_NAME=$1
    if dpkg -s "$PKG_NAME" &> /dev/null; then
        echo -e "${YELLOW}${PKG_NAME} is already installed. Skipping.${NC}"
    else
        echo -e "${GREEN}Installing ${PKG_NAME}...${NC}"
        if pkg install -y "$PKG_NAME"; then
            echo -e "${GREEN}${PKG_NAME} installation complete.${NC}\n"
        else
            echo -e "${RED}Failed to install ${PKG_NAME}.${NC}"
        fi
    fi
}

# --- Function to check and set up repository mirror ---
setup_repos() {
    echo -e "${GREEN}Checking Termux repositories...${NC}"
    if termux-change-repo; then
        echo -e "${GREEN}Repositories set up successfully.${NC}"
    else
        echo -e "${RED}Failed to set up repositories. Please check your internet connection or try again later.${NC}"
        exit 1
    fi
}

# --- Function to handle user choices ---
handle_choices() {
    local choice=$1
    case $choice in
        1) install_pkg "nmap";;
        2)
            echo -e "${GREEN}Installing netcat...${NC}"
            if pkg install -y nmap-ncat; then
                echo -e "${GREEN}netcat (nmap-ncat) installation complete.${NC}\n"
            else
                echo -e "${RED}Failed to install netcat (nmap-ncat).${NC}"
            fi
            ;;
        3) install_pkg "wget";;
        4) install_pkg "php";;
        5) install_pkg "curl";;
        6) install_pkg "python" && install_pkg "python2";;
        7)
            if command -v lolcat &> /dev/null; then
                echo -e "${GREEN}lolcat is already installed.${NC}"
            else
                echo -e "${YELLOW}lolcat not found, installing...${NC}"
                install_pkg "ruby"
                gem install lolcat
                echo -e "${GREEN}lolcat installation complete.${NC}"
            fi
            ;;
        8)
            echo -e "${GREEN}Checking for Termux-speak repository...${NC}"
            if [ -d "core/Termux-speak" ]; then
                echo -e "${YELLOW}Termux-speak repository found, pulling latest changes...${NC}"
                cd core/Termux-speak && git pull origin master && cd ../..
            else
                echo -e "${GREEN}Cloning Termux-speak repository...${NC}"
                mkdir -p core && cd core
                git clone https://github.com/TechnicalMujeeb/Termux-speak.git
                cd Termux-speak
                chmod +x *
                cd ../..
            fi
            echo -e "${GREEN}Termux-speak setup complete.${NC}\n"
            ;;
        9)
            if ! command -v git &> /dev/null; then
                echo -e "${RED}Git is not installed. Installing Git...${NC}"
                install_pkg "git"
            fi

            read -p "Enter the GitHub repository URL: " repo_url
            if [[ ! -z "$repo_url" ]]; then
                echo -e "${GREEN}Cloning repository from $repo_url...${NC}"
                if git clone "$repo_url"; then
                    echo -e "${GREEN}Repository cloned successfully.${NC}"
                else
                    echo -e "${RED}Failed to clone repository. Please check the URL or your connection.${NC}"
                fi
                read -p "Enter the directory name of the cloned repository to set permissions (or press Enter to skip): " repo_dir
                if [[ ! -z "$repo_dir" && -d "$repo_dir" ]]; then
                    chmod +x "$repo_dir"/*
                    echo -e "${GREEN}Executable permissions set for $repo_dir.${NC}"
                fi
            else
                echo -e "${YELLOW}No repository URL provided.${NC}\n"
            fi
            ;;
        0) exit 0;;
        *)
            echo -e "${RED}Invalid option: $choice${NC}"
            ;;
    esac
}

# --- Main menu ---
echo -e "${CYAN}Select the tools you want to install:${NC}"
echo -e "1. Nmap"
echo -e "2. Netcat"
echo -e "3. Wget"
echo -e "4. PHP"
echo -e "5. Curl"
echo -e "6. Python and Python2"
echo -e "7. lolcat"
echo -e "8. Termux-speak repository"
echo -e "9. Custom GitHub repository"
echo -e "0. Exit"

read -p "Enter the number(s) of the tools you want to install, separated by spaces: " choices
# Sanitize user input to only allow numbers and spaces
choices=$(echo "$choices" | tr -d -c '0-9 ')

# --- Setup repositories ---
setup_repos

# --- Process each choice ---
for choice in $choices; do
    handle_choices "$choice" || echo -e "${RED}An error occurred while handling choice: $choice.${NC}"
done

# --- Final message ---
if [[ $1 == "--fun" ]]; then
    echo -e "${YELLOW}Consider Checking Out Some Of My Other Projects, Star if You Like If Not Suck Ya Mum ;)${NC}"
else
    echo -e "${GREEN}Thank you for using LTerm-Pro! Please check out my other projects.${NC}"
fi

# --- End of script ---
echo -e "${RED}=========================================="
echo -e "           ALL DONE..."
echo -e "==========================================${NC}"

exit 0
