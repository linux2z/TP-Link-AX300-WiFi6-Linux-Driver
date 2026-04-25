# TP-Link AX300 (AIC8800) WiFi 6 Linux Driver

**Status:** Patched for Kernel 6.1+ (Ubuntu 22.04/24.04, Debian 12)

Professional Linux driver for TP-Link AX300 (AIC8800) WiFi 6 USB adapters. This repository contains the source code pre-patched for compatibility with modern Linux kernels.

## Key Features
- High Performance: Optimized for WiFi 6 (802.11ax) speeds.
- - Kernel Support: Includes patches for cfg80211 and modern kernels.
  - - Easy Setup: Automated installation script included.
    - - DKMS Compatible: Ready for cross-kernel updates.
     
      - ## Installation Steps
      - 1. Clone the repository:
        2.    git clone https://github.com/linux2z/TP-Link-AX300-WiFi6-Linux-Driver.git
        3.2. Run the installer:
             sudo bash install.sh

          ## Troubleshooting
        Check kernel logs using: dmesg | grep aic8800
        
