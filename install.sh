#!/bin/bash
# Advanced Tor + Proxy Auto Setup for Termux
# Author: Error101 (Optimized by Jr.hacker)


echo -e "\e[1;32m              ================================        "
echo -e "\e[1;32m      ~~~~~~~~|                              |~~~~~~~ "
echo -e "\e[1;31m      \       |   ༄tor᭄☠︎ TorProxyX ☠︎࿐proxy   |      / "
echo -e "\e[1;31m       \      |      ❚█══ł₦₴₮₳ⱠⱠł₦₲ ══█❚     |     /  "
echo -e "\e[1;32m       /      ================================     \  "
echo -e "\e[1;31m       ~~~~~~~~~~)     𝕙𝕒𝕔𝕜𝕖𝕣𝕖𝕣𝕣𝕠𝕣101      (~~~~~~~~~  "
echo ""
echo -e "\e[1;34m                     Coded By -> 𝔼𝕣𝕣𝕠𝕣101\n"
echo -e "\e[1;34m                        Version - 1.0"


# 🔹  Update & Install Necessary Packages
echo -e "\e[1;32m[+] ᵾⱣĐȺŦƗNǤ & ᵾⱣǤɌȺĐƗNǤ ŦɆɌMᵾX ⱣȺȻꝀȺǤɆS...\e[0m"
pkg update -y && pkg upgrade -y

echo -e "\e[1;32m\n[+] ƗNSŦȺŁŁƗNǤ ɌɆꝖᵾƗɌɆĐ ⱣȺȻꝀȺǤɆS...\e[0m"
pkg install tur-repo -y
pkg install tor privoxy netcat-openbsd curl -y

echo -e "\e[1;32m\n ✅✅ ŦØɌⱣɌØXɎX ƗⱣ ȻĦȺNǤɆɌ ƗS ƗNSŦȺŁŁɆĐ SᵾȻȻɆSSFᵾŁŁɎ  ✅✅ \e[0m"

echo -e "\e[32m      ┌───────────────────────────────────────┐\e[0m"
echo -e "\e[31m         \e[0m Now just type:➪ \e[31m bash TorProxyX.sh \e[0m"
echo -e "\e[32m      └───────────────────────────────────────┘\e[0m"
