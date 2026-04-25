# :rocket: TP-Link AX300 (AIC8800) WiFi 6 Linux Driver

![Kernel 6.1+](https://img.shields.io/badge/Kernel-6.1%2B-brightgreen?style=for-the-badge&logo=linux)
![WiFi 6](https://img.shields.io/badge/WiFi-6-blue?style=for-the-badge&logo=wi-fi)
![Stable](https://img.shields.io/badge/Status-Stable-success?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Ubuntu%2FDebian-orange?style=for-the-badge&logo=ubuntu)

Professional, high-performance Linux driver for the **TP-Link AX300** (AIC8800DC) WiFi 6 USB adapter. This repository is **fully self-contained**, meaning it includes all source code and firmware files necessary for a seamless installation even without internet.

---

## :sparkles: Key Features

- **:penguin: Full Kernel 6.1+ Support**: Pre-patched to fix common compilation errors like `cfg80211` and `eth_hw_addr_set`.
- - **:package: Self-Contained**: No internet connection required after initial clone. Includes all firmware binaries.
  - - **:zap: One-Click Installer**: Automated `install.sh` script handles compilation, installation, and firmware deployment.
    - - **:satellite: WiFi 6 Ready**: Supports high-speed 802.11ax features for modern networking.
     
      - ---

      ## :computer: Quick Start (One-Click Install)

      Simply run these commands in your terminal:

      ```bash
      git clone https://github.com/linux2z/TP-Link-AX300-WiFi6-Linux-Driver
      cd TP-Link-AX300-WiFi6-Linux-Driver
      sudo bash install.sh
      ```

      ---

      ## :hammer_and_wrench: Manual Installation

      If you prefer to do things manually:

      1. **Build the Driver**:
      2.    ```bash
               cd src/drivers/aic8800/aic8800_fdrv
               make -j$(nproc)
               ```
            2. **Install Module**:
            3.    ```bash
                     sudo insmod aic8800_fdrv.ko
                     ```

                  ---

              ## :page_facing_up: LicenseThis project is shared under the GPL License.---:star: ** If this helped you, please give it a star!** :star:
