#!/bin/bash
# Professional Installer for TP-Link AX300 (AIC8800) WiFi 6 Driver

echo "-------------------------------------------------"
echo "TP-Link AX300 (AIC8800) WiFi 6 Driver Installer"
echo "Professional Edition - Self-Contained"
echo "-------------------------------------------------"

# Check for root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
    exit 1
    fi

    REPO_ROOT=$(pwd)

    # Install build dependencies
    echo "[1/4] Installing dependencies..."
    apt update && apt install -y build-essential linux-headers-$(uname -r) bc dkms

    # Prepare driver source
    echo "[2/4] Compiling driver..."
    cd src/drivers/aic8800/aic8800_fdrv
    make -j$(nproc)

    # Install driver
    echo "[3/4] Installing driver modules..."
    make install

    # Install firmware
    echo "[4/4] Installing firmware..."
    mkdir -p /lib/firmware/aic8800DC
    cp $REPO_ROOT/src/fw/aic8800DC/*.bin /lib/firmware/aic8800DC/
    cp $REPO_ROOT/src/fw/aic8800DC/*.txt /lib/firmware/aic8800DC/

    echo "-------------------------------------------------"
    echo "Installation Complete!"
    echo "Please REBOOT your system or run: sudo modprobe aic8800_fdrv"
    echo "-------------------------------------------------"
    
