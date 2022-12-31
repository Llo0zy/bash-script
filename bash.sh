function extractPorts(){

    echo -e "\n${yellowColour}[*] Extracting information...${endcolour}\n"
    ip_address=$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u)
    open_ports=$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS="/" | xargs | tr ' ' ',')

    echo -e "\t${blueColour}[*] IP Address: ${endColour}${grayColour}$ip_address${endColour}"
    echo -e "\t${blueColour}[*] Open Ports: ${endColour}${grayColour}$open_ports${endColour}\n"

    echo $open_ports | tr -d '\n' | xclip -sel clip
    echo -e "${yellowColour}[*] Ports has been copied to clipboard!$open_ports${endColour}\n"
}
