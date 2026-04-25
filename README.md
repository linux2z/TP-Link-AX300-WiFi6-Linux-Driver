# TP-Link AX300 (AIC8800) WiFi 6 Linux Driver

**Status:** Patched for Kernel 6.1+ (Ubuntu 22.04/24.04, Debian 12)

Professional Linux driver for TP-Link AX300 (AIC8800) WiFi 6 USB adapters. This repository contains the source code pre-patched for compatibility with modern Linux kernels (6.1 and newer).

## Features
* High Performance: Optimized for WiFi 6 (802.11ax) speeds.
* * Kernel 6.1+ Support: Includes patches for cfg80211 and eth_hw_addr_set.
  * * Automated Installation: Simple one-click script for setup.
    * * DKMS Support: (Optional) Keep the driver working across kernel updates.
     
      * ## Installation
      * 1. Clone the repository:
        2.    ```bash
                 git clone https://github.com/linux2z/TP-Link-AX300-WiFi6-Linux-Driver.git
                 cd TP-Link-AX300-WiFi6-Linux-Driver
                 ```
              2. Make the installer executable:
              3.    ```bash
                       chmod +x install.sh
                       ```
                    3. Run the installer:
                    4.    ```bash
                             sudo bash install.sh
                             ```

                          ## Troubleshooting
                      * Mode Switching: If the device is detected as a CD-ROM/Storage, ensure usb-modeswitch is installed.
                      * * Logs: Check kernel logs for errors:
                        *   ```bash
                              dmesg | grep aic8800
                              ```
                            
