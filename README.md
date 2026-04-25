# TP-Link AX300 (AIC8800) WiFi 6 Linux Driver

![Kernel 6.1+](https://img.shields.io/badge/Kernel-6.1%2B-brightgreen?style=for-the-badge&logo=linux)
![WiFi 6](https://img.shields.io/badge/WiFi-6-blue?style=for-the-badge&logo=wi-fi)
![Stable](https://img.shields.io/badge/Status-Stable-success?style=for-the-badge)

Professional, high-performance Linux driver for the **TP-Link AX300** (AIC8800DC) WiFi 6 USB adapter. This repository is **fully self-contained**, meaning it includes all source code and firmware files necessary for an offline installation.

---

## Key Features

- **Full Kernel 6.1+ Support**: Pre-patched to fix common compilation errors like `cfg80211` and `eth_hw_addr_set`.
- - **Self-Contained**: No internet connection required after initial clone. Includes all firmware binaries.
  - - **One-Click Installer**: Automated `install.sh` script handles compilation, installation, and firmware deployment.
    - - **WiFi 6 Ready**: Supports high-speed 802.11ax features.
     
      - ---

      ## Compatibility

      | Component | Support Status |
      | :--- | :--- |
      | **Hardware** | TP-Link AX300 (AIC8800DC chipset) |
      | **OS** | Ubuntu, Debian, Armbian, Raspberry Pi OS |
      | **Arch** | x86_64, ARM64 (RK3588, CM3588, etc.) |
      | **Kernel** | 5.10, 5.15, 6.1, 6.6+ |

      ---

      ## Quick Start (Installation)

      Simply run the following commands in your terminal:

      ```bash
      git clone https://github.com/linux2z/TP-Link-AX300-WiFi6-Linux-Driver
      cd TP-Link-AX300-WiFi6-Linux-Driver
      sudo bash install.sh
      ```

      **That's it!** The script will:
      1. Install necessary build tools.
      2. 2. Compile the driver from the included `src` folder.
         3. 3. Install the kernel module.
            4. 4. Deploy firmware to `/lib/firmware/aic8800DC/`.
               5. 5. Load the driver.
                 
                  6. ---
                 
                  7. ## Manual Installation (Advanced)
                 
                  8. If you prefer to do it yourself:
                 
                  9. 1. **Build the driver**:
                     2.    ```bash
                              cd src/drivers/aic8800/aic8800_fdrv
                              make -j$(nproc)
                              ```
                           2. **Install the module**:
                           3.    ```bash
                                    sudo cp aic8800_fdrv.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless/
                                    sudo depmod -a
                                    ```
                                 3. **Copy Firmware**:
                                 4.    ```bash
                                          sudo mkdir -p /lib/firmware/aic8800DC
                                          sudo cp src/firmware/aic8800DC/* /lib/firmware/aic8800DC/
                                          ```

                                       ---

                                   ## Support

                             If you find this useful, please **give it a star!**
                       For issues, please open a ticket in the [Issues](https://github.com/linux2z/TP-Link-AX300-WiFi6-Linux-Driver/issues) tab.

                       ---
                     *Maintained by [linux2z](https://github.com/linux2z)*
                     
