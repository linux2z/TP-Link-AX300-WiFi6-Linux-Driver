# 🚀 TP-Link AX300 (AIC8800) WiFi 6 Linux Driver

![License](https://img.shields.io/badge/License-GPL%20v2-blue.svg)
![Kernel](https://img.shields.io/badge/Kernel-6.1%2B-green.svg)
![WiFi](https://img.shields.io/badge/WiFi-6%20(802.11ax)-orange.svg)
![Status](https://img.shields.io/badge/Status-Stable-brightgreen.svg)
![Architecture](https://img.shields.io/badge/Arch-ARM64%20%7C%20x86__64-purple.svg)

> 📶 **Professional, pre-patched Linux driver for TP-Link AX300 USB WiFi 6 adapters using the AICSemi AIC8800DC chipset. Fully self-contained — works offline after cloning!**

---

## ✨ Features

| Feature | Details |
|---------|---------|
| 📡 **WiFi 6 (802.11ax)** | Full WiFi 6 support with high throughput |
| 🔧 **Pre-Patched** | Ready for Kernel 6.1+ out of the box |
| 📦 **Self-Contained** | All source code & firmware included — no internet needed to install |
| 🔄 **DKMS Support** | Driver survives kernel updates automatically |
| ⚡ **One-Click Install** | Just run `install.sh` and you're online |
| 🖥️ **Multi-Arch** | Supports ARM64 (CM3588, RK3588) and x86_64 |

---

## 🚀 Quick Start

```bash
# Clone the repository (requires internet once)
git clone https://github.com/linux2z/TP-Link-AX300-WiFi6-Linux-Driver.git

# Run the installer
cd TP-Link-AX300-WiFi6-Linux-Driver
sudo bash install.sh
```

> 💡 **Tip:** Clone this repo while connected via Ethernet. After installation, your WiFi will be ready!

---

## 📋 Requirements

- 🐧 Ubuntu 20.04 / 22.04 / 24.04, Debian 11/12, or compatible
- 🔨 Build tools: `dkms`, `build-essential`, `linux-headers`
- 🔌 TP-Link AX300 USB adapter (AIC8800DC chipset)

The installer will automatically install missing build tools if you have internet access.

---

## 🧠 The Challenge & The Solution

The TP-Link AX300 WiFi 6 USB dongle uses the **AICSemi AIC8800DC** chipset, which has **zero native support** in the standard Linux kernel. Getting it to work required solving **4 major problems**:

### 🔴 Problem 1: The "Virtual CD-ROM" Trick

> When you first plug the dongle in, it pretends to be a **CD-ROM drive** containing Windows drivers. Linux sees a disk drive — not a WiFi card!

**✅ Solution:** We installed a **udev rule** that automatically detects the fake CD-ROM ID (`a69c:5721`) and runs an "eject" command. This forces the hardware to reveal its true identity as a WiFi adapter (`3625:0110`).

---

### 🔴 Problem 2: Kernel 6.1 API Breaking Changes

> Most available AIC8800 drivers were written for **Kernel 4.x/5.x**. Kernel 6.1 changed critical internal APIs:
> - WiFi channel switching functions changed from **3 arguments to 4 or 6**
> - The MAC address storage became **read-only** (`const`), causing the old driver to trigger a **Kernel Panic** 💀

**✅ Solution:** We applied **3 critical code patches**:
1. Updated `cfg80211_ch_switch_notify()` to the new 4-argument signature
2. Updated `cfg80211_ch_switch_started_notify()` to the new 6-argument signature
3. Replaced unsafe `memcpy(ndev->dev_addr, ...)` with the modern `eth_hw_addr_set()` function

---

### 🔴 Problem 3: Missing Firmware Blobs

> Even with a working driver, the WiFi chip is "brain-dead" until it receives firmware from the host computer. The standard Linux firmware folders **don't include** the AIC8800DC files.

**✅ Solution:** We bundled the correct firmware files (`fmacfw_patch_8800dc_u02.bin`, `fw_patch_8800dc_u02.bin`, etc.) directly in this repository under `src/fw/aic8800DC/`.

---

### 🔴 Problem 4: Driver Breaks on Reboot

> Manually compiled kernel modules get wiped out after system updates or reboots.

**✅ Solution:** We use **DKMS (Dynamic Kernel Module Support)** to register the driver with the system. It automatically rebuilds itself whenever the kernel is updated.

---

### 🎉 The Result

After installation, the system:
- ✅ Automatically switches the dongle out of "CD-ROM mode" on plug-in
- ✅ Loads the patched driver with full Kernel 6.1+ compatibility
- ✅ Creates a `wlan0` interface ready for WiFi connections
- ✅ Survives reboots and kernel updates via DKMS

---

## 🔧 Useful WiFi Commands

```bash
# Scan for networks
nmcli dev wifi list

# Connect to a network
nmcli dev wifi connect "YourSSID" password "YourPassword"

# Check connection status
nmcli device status

# Interactive WiFi manager
nmtui
```

---

## 🐛 Troubleshooting

| Problem | Solution |
|---------|----------|
| No `wlan0` after install | Run `sudo modprobe aic_load_fw && sudo modprobe aic8800_fdrv` |
| Device shows as CD-ROM | Run `sudo eject /dev/sr1` then reload modules |
| Driver fails to build | Install headers: `sudo apt install linux-headers-$(uname -r)` |
| Check driver logs | Run `dmesg \| grep aic` |

---

## 📂 Repository Structure

```
TP-Link-AX300-WiFi6-Linux-Driver/
├── install.sh          # 🚀 One-click installer
├── README.md           # 📖 This file
└── src/                # 📦 Full driver source (pre-patched)
    ├── drivers/        # Kernel module source code
    ├── fw/             # Firmware binaries
    ├── tools/          # udev rules
    └── dkms.conf       # DKMS configuration
```

---

## ⭐ Support

If this driver helped you, please **star** ⭐ this repository! It helps others find it.

---

## 📜 License

This project is licensed under the **GPL v2 License** — see the [LICENSE](LICENSE) file for details.

**Credits:** Based on the [Kiborgik/aic8800dc-linux-patched](https://github.com/Kiborgik/aic8800dc-linux-patched) project with additional Kernel 6.1 patches by [@linux2z](https://github.com/linux2z).
