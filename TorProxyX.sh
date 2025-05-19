#!/bin/bash
# Advanced Tor + Proxy Auto Setup for Termux
# Author: Error101 (Optimized by Jr.hacker)
 
echo -e "\e[31m              ████████╗ ██████╗ ██████╗ ██████╗ ██████╗  ██████╗ ██╗  ██╗██╗   ██╗██╗  ██╗   \e[0m"   
echo -e "\e[31m              ╚══██╔══╝██╔═══██╗██╔══██╗██╔══██╗██╔══██╗██╔═══██╗╚██╗██╔╝╚██╗ ██╔╝╚██╗██╔╝   \e[0m" 
echo -e "\e[31m                 ██║   ██║   ██║██████╔╝██████╔╝██████╔╝██║   ██║ ╚███╔╝  ╚████╔╝  ╚███╔╝    \e[0m" 
echo -e "\e[31m                 ██║   ██║   ██║██╔══██╗██╔═══╝ ██╔══██╗██║   ██║ ██╔██╗   ╚██╔╝   ██╔██╗    \e[0m" 
echo -e "\e[31m                 ██║   ╚██████╔╝██║  ██║██║     ██║  ██║╚██████╔╝██╔╝ ██╗   ██║   ██╔╝ ██╗   \e[0m" 
echo -e "\e[31m                 ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝   \e[0m"


echo -e "\e[32m  			================               ========================      \e[0m"
echo -e "\e[32m     	   	 	  Version:\e[0m \e[31m1.0   \e[0m" "\e[32m		Code Author:\e[0m \e[31m 𝔼𝕣𝕣𝕠𝕣101    \e[0m"
echo -e "\e[32m      	 		================               ========================      \e[0m"


echo -e "\e[32m                			 GitHub Profile:\e[0m"
echo -e "\e[31m                           	https://github.com/error101bd  \e[0m"


# 🔹  Kill Existing Tor & Setup Environment
echo -e "\e[1;31m\n[+] SŦØⱣⱣƗNǤ ØŁĐ ŦØɌ & ⱣɌƗVØXɎ ȻØNFƗǤᵾɌȺŦƗØN...\e[0m"
pkill tor
pkill privoxy
rm -rf ~/.tor_multi ~/.privoxy
mkdir -p ~/.tor_multi ~/.privoxy

# 🔹  Start Tor and Privoxy Services
echo -e "\e[1;32m[+] ŁȺᵾNȻĦƗNǤ ŦØɌ NØĐɆS & ⱣɌØXɎ SɆɌVɆɌ...\e[0m"

PORTS=(9050 9060 9070 9080 9090)
CONTROL_PORTS=(9051 9061 9071 9081 9091)
AUTH_PASSWORD="mysecurepassword"

for i in {0..4}; do
    TOR_DIR="$HOME/.tor_multi/tor$i"
    mkdir -p "$TOR_DIR"
    cat <<EOF > "$TOR_DIR/torrc"
SocksPort ${PORTS[$i]}
ControlPort ${CONTROL_PORTS[$i]}
HashedControlPassword $(tor --hash-password "$AUTH_PASSWORD" | tail -n1)
DataDirectory $TOR_DIR
EOF
    tor -f "$TOR_DIR/torrc" > /dev/null 2>&1 &
    sleep 2
done

# 🔹  Setup Privoxy
cat <<EOF > "$HOME/.privoxy/config"
listen-address 127.0.0.1:8118
EOF
for port in "${PORTS[@]}"; do
    echo "forward-socks5 / 127.0.0.1:$port ." >> "$HOME/.privoxy/config"
done
privoxy "$HOME/.privoxy/config" > /dev/null 2>&1 &

# 🔹  User Input: IP Rotation Timer
echo -ne "\e[1;36mɆNŦɆɌ ƗⱣ ɌØŦȺŦƗØN ƗNŦɆɌVȺŁ (ƗN SɆȻØNĐS, MƗN 5s): \e[0m"
read -r ROTATION_TIME
ROTATION_TIME=$(echo "$ROTATION_TIME" | tr -d ' ')

if [[ ! "$ROTATION_TIME" =~ ^[0-9]+$ ]] || [[ "$ROTATION_TIME" -lt 5 ]]; then
    echo -e "\e[1;31mInvalid input! Using default 10 seconds.\e[0m"
    ROTATION_TIME=10
fi

echo -e "\e[1;31m\n ⱣŁɆȺSɆ WȺƗŦ FØɌ ȻØNNɆȻŦƗØN🛰️ {1-5} MƗNᵾŦɆS...\e[0m"


# 🔹  Auto IP Changer with Proxy Verification
echo -e "\e[1;35m\n[*] ŦØɌ ⱣɌØXɎ ɌᵾNNƗNǤ ØN: ❚█══127.0.0.1:8118══█❚ 🛰️\e[0m"
while true; do
    for ctrl_port in "${CONTROL_PORTS[@]}"; do
        echo -e "AUTHENTICATE \"$AUTH_PASSWORD\"\r\nSIGNAL NEWNYM\r\nQUIT" | nc 127.0.0.1 $ctrl_port > /dev/null 2>&1
    done
    NEW_IP=$(curl --proxy http://127.0.0.1:8118 -s https://api64.ipify.org)
    echo -e "\e[1;32m🌐 New IP: $NEW_IP ✅\e[0m"
    echo -e "\e[1;34m[Proxy]: 127.0.0.1:8118 🛰️\e[0m"
    sleep "$ROTATION_TIME"
done



