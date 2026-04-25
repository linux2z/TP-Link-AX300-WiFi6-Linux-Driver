# TP-Link AX300 (AIC8800) WiFi 6 Linux Driver

Professional Linux driver for the TP-Link AX300 (AIC8800) WiFi 6 USB adapter. This repository provides a **self-contained**, pre-patched driver that is compatible with modern Linux kernels (up to Kernel 6.1+).

## Features
- **Self-Contained**: No external downloads required for the driver source or firmware.
- **Kernel 6.1+ Compatible**: Includes critical patches for `cfg80211` and `eth_hw_addr_set`.
- **Automated Installer**: Single-command installation script.

## Compatibility
- **Hardware**: TP-Link AX300, AIC8800DC based adapters.
- **OS**: Ubuntu, Debian, Armbian (Tested on CM3588/RK3588).
- **Kernel**: 5.x, 6.x (Tested on 6.1).

## Quick Start
1. **Clone the repository**:
   \`\`\`bash
   git clone https://github.com/linux2z/TP-Link-AX300-WiFi6-Linux-Driver
   cd TP-Link-AX300-WiFi6-Linux-Driver
   \`\`\`
2. **Run the installer**:
   \`\`\`bash
   sudo bash install.sh
   \`\`\`
3. **Reboot** or load the driver:
   \`\`\`bash
   sudo modprobe aic8800_fdrv
   \`\`\`

## Troubleshooting
- Ensure you have `build-essential` and `linux-headers` installed (the script attempts to install them, but requires internet via Ethernet).
- If the driver doesn't load, check `dmesg | grep aic` for errors.

---
*Maintained by linux2z*
