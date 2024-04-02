#!/bin/bash

# Function to check if running as root
check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo "[❗] Please run as root or using sudo"
        exit 1
    fi
}

sudo apt update
sudo apt install dante-server -y
sudo rm /etc/danted.conf
curl -O https://raw.githubusercontent.com/Houshasei/ez-proxy/main/danted.conf
sudo mv -f danted.conf /etc
sudo ufw allow 1080:1083/tcp
sudo useradd -r -s /bin/false kbzol
sudo passwd kbzol
sudo systemctl restart danted.service
systemctl status danted.service

# Main script
check_root
