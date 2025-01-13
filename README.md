# P2000T SD-card Image

[![build](https://github.com/ifilot/p2000t-sdcard-image/actions/workflows/nightly-build.yml/badge.svg)](https://github.com/ifilot/p2000t-sdcard-image/actions/workflows/nightly-build.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![discord](https://img.shields.io/discord/1167925678868541451?logo=discord&logoColor=white)](https://discord.gg/YtzJTWYAxy)

This repository provides an SD-card image designed for the 
[P2000T SD-card cartridge](https://github.com/ifilot/p2000t-sdcard-image), 
containing the latest version of all available cassette files and programs.

> [!TIP] 
> Have questions or comments about the **P2000T SD-card images**? Join
> the conversation and chat with the developers on our [Discord
> server](https://discord.gg/YtzJTWYAxy).

---

## 📂 Contents
The repository contains:
- A single `.img` file (`p2000t-sd-card.img`) that can be flashed to an SD-card.
- The `.img` file is updated regularly to include the latest versions of all
  cassette files and programs compatible with the P2000T SD-card cartridge.

---

## 🚀 How to Use

### 1. **Download the Latest Image**
Download the latest SD-card image from [here](https://github.com/ifilot/p2000t-sdcard-image/releases/download/nightly/p2000t-sd-card.img.zip).

> [!NOTE] 
> The SD-card image is designed with a size of **1 GiB**, ensuring
> compatibility with all SD cards that have at least **1 GiB** of capacity. 
> 
> While expanding the partition is **optional** and not required for 
> functionality, you can expand it if you'd like the partition to utilize the 
> entire storage space of your SD card.

### 2. **Flash the Image to an SD-Card**
To write the `.img` file to your SD-card, use one of the following tools:

#### **Option 1: Balena Etcher**
1. Download and install [Balena Etcher](https://www.balena.io/etcher/).
2. Open Balena Etcher and select the `.img` file.
3. Insert your SD-card and choose it as the target device.
4. Click "Flash" to write the image to the SD-card.

#### **Option 2: Raspberry Pi Imager**
1. Download and install the [Raspberry Pi Imager](https://www.raspberrypi.org/software/).
2. Open the tool, select "Use Custom," and choose the `.img` file.
3. Insert your SD-card and select it as the target device.
4. Click "Write" to flash the image.

#### **Option 3: `dd` Command (Linux/Mac)**
1. Open a terminal and run the following command:
   ```bash
   sudo dd if=p2000t-sd-card.img of=/dev/sdX bs=4M status=progress