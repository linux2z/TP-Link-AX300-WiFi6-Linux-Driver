#!/bin/bash
echo "--------------------------------------------------"
echo "TP-Link WiFi 6 (AIC8800) Automatic Installer"
echo "--------------------------------------------------"

# Check for internet
if ! ping -c 1 google.com &>/dev/null; then
    echo "ERROR: Internet connection required to download build tools."
        echo "Please connect an Ethernet cable first."
            exit 1
            fi

            # Install dependencies
            sudo apt update
            sudo apt install -y git dkms build-essential linux-headers-$(uname -r)

            # Cleanup old attempts
            rm -rf ~/aic8800_temp

            # Clone and Patch
            git clone --depth 1 https://github.com/Kiborgik/aic8800dc-linux-patched.git ~/aic8800_temp
            cd ~/aic8800_temp

            echo "Applying patches for Kernel 6.1+..."
            sed -i "s/memcpy(ndev->dev_addr, mac_addr, ETH_ALEN);/eth_hw_addr_set(ndev, mac_addr);/" drivers/aic8800/aic8800_fdrv/rwnx_main.c
            sed -i "s/cfg80211_ch_switch_notify(\([^,]\+\), \&csa->chandef, 0)/cfg80211_ch_switch_notify(\1, \&csa->chandef, 0, 0)/" drivers/aic8800/aic8800_fdrv/rwnx_main.c
            sed -i "s/cfg80211_ch_switch_started_notify(\([^,]\+\), \&csa->chandef, 0, \([^,]\+\), \([^)]\+\))/cfg80211_ch_switch_started_notify(\1, \&csa->chandef, 0, \2, \3, 0)/" drivers/aic8800/aic8800_fdrv/rwnx_main.c

            # Install
            sudo bash ./install.sh

            echo "--------------------------------------------------"
            echo "INSTALLATION COMPLETE!"
            echo "Your WiFi should appear in the top-right menu now."
            echo "--------------------------------------------------"
            read -p "Press Enter to finish..."
            
