#!/bin/bash

# --- Define colors for output ---
RED='\033[1;91m'
GREEN='\033[1;92m'
YELLOW='\033[1;93m'
CYAN='\033[1;96m'
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
        2) install_pkg "nmap-ncat";;  # Netcat
        3) install_pkg "wget";;
        4) install_pkg "php";;
        5) install_pkg "curl";;
        6) install_pkg "python" && install_pkg "python2" && install_pkg "python3";;
        7) install_pkg "ruby" && gem install lolcat;;
        8) # Clone Termux-speak repository
            if [ -d "core/Termux-speak" ]; then
                cd core/Termux-speak && git pull origin master && cd ../..
            else
                mkdir -p core && cd core
                git clone https://github.com/TechnicalMujeeb/Termux-speak.git
                cd Termux-speak && chmod +x * && cd ../..
            fi
            ;;
        9) install_pkg "git";;
        10) install_pkg "openssh";;
        11) pkg install unstable-repo && install_pkg "";;
        12) install_pkg "";;
        13) install_pkg "htop";;
        14) install_pkg "neofetch";;
        15) install_pkg "nodejs";;
        16) install_pkg "tmux";;
        17) install_pkg "termux-api";;
        18)
    if [ -d "$HOME/storage" ]; then
        echo -e "${YELLOW}~/storage already exists. Skipping storage setup.${NC}"
    else
        termux-setup-storage
    fi
    curl -L https://raw.githubusercontent.com/OzakIOne/termux-youtube-dl/v2.0.1/install.sh | bash
    ;;
        19) install_pkg "fzf";;
        20) install_pkg "zsh";;
        21) install_pkg "lynx";;
        22) install_pkg "mc";;
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
echo -e "6. Python and Python2 & Python3(All)"
echo -e "7. lolcat"
echo -e "8. Termux-speak repository"
echo -e "9. Git"
echo -e "10. OpenSSH"
echo -e "11. Metasploit"
echo -e "12. SQLmap"
echo -e "13. htop"
echo -e "14. Neofetch"
echo -e "15. Node.js and npm"
echo -e "16. Tmux"
echo -e "17. Termux API"
echo -e "18. YouTube-dl"
echo -e "19. fzf (Fuzzy finder)"
echo -e "20. Zsh (Differnt to Bash)"
echo -e "21. Lynx (Text Based Browser)"
echo -e "22. Mc"
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
