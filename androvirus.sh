#!/bin/bash
clear
echo -e "\a\a\e[31;1m
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
\e[37m            ▞▀▖     ▌      ▌ ▌▗
            ▙▄▌▛▀▖▞▀▌▙▀▖▞▀▖▚▗▘▄ ▙▀▖▌ ▌▞▀▘
            ▌ ▌▌ ▌▌ ▌▌  ▌ ▌▝▞ ▐ ▌  ▌ ▌▝▀▖
            ▘ ▘▘ ▘▝▀▘▘  ▝▀  ▘ ▀▘▘  ▝▀▘▀▀ \e[4mversion 2.2\e[0m
"
echo -e "\e[0;1m-----------------------------------------------------------\e[0m"
echo -e "\e[32;1mInstalling AndroVirus.....\n"
if [[ -d "$HOME/.fxv" ]] ; then
    printf "Virus directory found skipping installation\n"
else
    printf "Installing requirements it may take some time\n"
    cd 
    curl -LO https://github.com/Anon4You/AndroVirus/raw/main/lib/av.tar.gz
    curl -Lo https://github.com/Anon4You/AndroVirus/raw/main/lib/av
    mv av $PATH ; chmod 777 $PATH/av
    if hash ! php > /dev/null 2>&1 ; then
        printf "installing php..."
        apt install -y php
    fi
    if hash ! cloudfalred > /dev/null 2>&1 ; then
        printf "installing cloudflared..."
        apt install -y cloudflared
    fi
    tar -zxf av.tar.gz > /dev/null 2>&1
    rm av.tar.gz
fi
echo -e "\e[0m
Author:Anon4You[Alienkrishn]

Run the tool by typing \e[32;1m'av'\e[0m from anywhere
"

