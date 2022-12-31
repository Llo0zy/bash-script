# Requeriments -> sudo apt install xclip -y

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function extractPorts(){

    echo -e "\n${yellowColour}[*] Extracting information...${endcolour}\n"
    ip_address=$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u)
    open_ports=$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS="/" | xargs | tr ' ' ',')
    close_ports=$(cat $1 | grep -oP '\d{1,5}/close' | awk '{print $1}' FS="/" | xargs | tr ' ' ',')

    echo -e "\t${blueColour}[*] IP Address: ${endColour}${grayColour}$ip_address${endColour}"

    if [ ! $open_ports ]; then
        :
    else
        echo -e "\t${blueColour}[*] Open Ports: ${endColour}${grayColour}$open_ports${endColour}\n"
    fi

    if [ ! $close_ports ]; then
        :
    else
        echo -e "\t${blueColour}[*] Close Ports: ${endColour}${grayColour}$close_ports${endColour}\n"
    fi

    echo $open_ports | tr -d '\n' | xclip -sel clip
    echo -e "${yellowColour}[*] Ports has been copied to clipboard!${endColour}\n"
}
