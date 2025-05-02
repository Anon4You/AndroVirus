#!/bin/bash

RED='\e[31;1m'
GREEN='\e[32;1m'
YELLOW='\e[33;1m'
BLUE='\e[34;1m'
RESET='\e[0m'
BOLD='\e[1m'

INSTALL_DIR="$PREFIX/share/androvirus"
LAUNCHER_PATH="$PREFIX/bin/androvirus"
REPO_URL="https://github.com/Anon4You/AndroVirus.git"

install_packages() {
    echo -e "${YELLOW}Updating packages...${RESET}"
    apt update -y
    
    echo -e "\n${YELLOW}Installing requirements...${RESET}"
    apt install -y git php cloudflared
}

clone_repo() {
    echo -e "\n${YELLOW}Setting up AndroVirus...${RESET}"
    
    [ -d "$INSTALL_DIR" ] && rm -rf "$INSTALL_DIR"
    
    git clone "$REPO_URL" "$INSTALL_DIR"
    chmod +x "$INSTALL_DIR/androvirus.sh"
}

create_launcher() {
    echo -e "\n${YELLOW}Creating launcher...${RESET}"
    
    cat > "$LAUNCHER_PATH" <<- EOL
#!/bin/bash
cd "$INSTALL_DIR" && bash androvirus.sh
EOL
    
    chmod +x "$LAUNCHER_PATH"
}

verify_installation() {
    [ -f "$INSTALL_DIR/androvirus.sh" ] && [ -f "$LAUNCHER_PATH" ] && {
        echo -e "${GREEN}Installation successful!${RESET}"
        echo -e "\nRun with: ${BOLD}androvirus${RESET}"
    } || {
        echo -e "${RED}Installation failed!${RESET}"
        exit 1
    }
}

echo -e "${BOLD}AndroVirus Installer${RESET}"
echo -e "${BLUE}---------------------${RESET}"

[ ! -d "$PREFIX" ] && {
    echo -e "${RED}Error: Run in Termux!${RESET}"
    exit 1
}

install_packages
clone_repo
create_launcher
verify_installation

echo -e "\n${GREEN}Installation complete!${RESET}"
