# Tor + Proxy Auto Setup for Termux
**Advanced Tor & Proxy Auto-Setup Script for Termux**  
🚀 **Author:** Error101  
🔗 **GitHub:** [https://github.com/hackererror101](https://github.com/hackererror101)  

## 📌 Features:
- Auto Tor Proxy Setup (Multiple Nodes)
- IP Auto Rotation with Custom Timer
- Socks5 Proxy Support (127.0.0.1:8118)
- Secure Tor Control Authentication
- Privoxy Integration for HTTP Proxy
- Lightweight & Fast Execution  

---

## ⚙️ Installation & Usage:
### **1️⃣ Install Required Packages:**
```bash
pkg update -y && pkg upgrade -y
pkg install tur-repo -y
pkg install tor privoxy netcat-openbsd curl -y

2️⃣ Clone the Repository:

git clone https://github.com/hackererror101/TorProxyTermux.git
cd TorProxyTermux

3️⃣ Run the Script:

chmod +x install.sh

./install.sh

bash TorProxyX.sh

4️⃣ Set IP Rotation Timer:

When the script is run, it will ask for the IP Rotation Interval (Seconds) input.

A minimum of 5 seconds must be given.

If no input is provided, the default will be 10 seconds.



---
📡 Proxy Information:


---
🔌 Connect Phone to Proxy (Android)

1️⃣ Proxy Enable for Termux:

First, enter the following command to set up a proxy for Termux:

export http_proxy="http://127.0.0.1:8118"
export https_proxy="http://127.0.0.1:8118"

To check:

curl https://api64.ipify.org


2️⃣ Connect Whole Device to Proxy:

Option 1: Android WiFi Proxy Setup

WiFi Settings ➝ Modify Network ➝ Advanced Options

Proxy: Manual

Proxy Hostname: 127.0.0.1

Proxy Port: 8118

Save & Connect

Option 2: Using NetHunter App (Root Required)

NetHunter ➝ Kali Services ➝ Start Proxychains

Proxy Type: SOCKS5

Proxy Address: 127.0.0.1

Port: 8118


Option 3: Using proxychains (For CLI Users)

pkg install proxychains-ng -y
echo -e "socks5 127.0.0.1 8118" > $HOME/.proxychains/proxychains.conf
proxychains curl https://api64.ipify.org

✔ In this way, all phone traffic will go through Tor Proxy.

🔄 IP Auto Rotation:

The script uses Tor ControlPort to get a new IP.

For changing IP:

echo -e "AUTHENTICATE \"mysecurepassword\"\r\nSIGNAL NEWNYM\r\nQUIT" | nc 127.0.0.1 9051

Or, the script will do Auto Rotation every 10 seconds (can be customized).



---

🛑 Stop Proxy:

pkill tor
pkill privoxy


---
📢 Note:

It may take 1-5 minutes for the Tor node to load after running for the first time.

If the new IP doesn't work, restart the Tor node:

pkill tor && pkill privoxy
bash TorProxyX.sh



---

🔗 Contact & Support:

💡 GitHub: https://github.com/hackererror101
💬 Issue Report: Open an issue on GitHub


---

🔥 Enjoy Anonymous Browsing! 🚀

---

