# P2000T SD-card Image

[![build](https://github.com/ifilot/p2000t-sdcard-image/actions/workflows/nightly-build.yml/badge.svg)](https://github.com/ifilot/p2000t-sdcard-image/actions/workflows/nightly-build.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![discord](https://img.shields.io/discord/1167925678868541451?logo=discord&logoColor=white)](https://discord.gg/YtzJTWYAxy)

This repository provides an SD-card image designed for the 
[P2000T SD-card cartridge](https://github.com/ifilot/p2000t-sdcard), 
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

#### **Option 1: Raspberry Pi Imager**
1. Download and install the [Raspberry Pi Imager](https://www.raspberrypi.org/software/).
2. Open the tool, select "Use Custom," and choose the `.img` file.
3. Insert your SD-card and select it as the target device.
4. Click "Write" to flash the image.

#### **Option 2: Balena Etcher**
1. Download and install [Balena Etcher](https://www.balena.io/etcher/).
2. Open Balena Etcher and select the `.img` file.
3. Insert your SD-card and choose it as the target device.
4. Click "Flash" to write the image to the SD-card.

#### **Option 3: `dd` Command (Linux/Mac)**
1. Open a terminal and run the following command:
   ```bash
   sudo dd if=p2000t-sd-card.img of=/dev/sdX bs=4M status=progress

## Formatting SD-card

Sometimes the procedure to flash the SD-card fails. In that circumstance,
please follow the instructions below.

1. Type `WINDOWS + R` and run `CMD`.
2. Run `diskpart`.
3. Type `list disk` followed by `select disk <NR>` where `<NR>` corresponds to
   your SD-card.
4. Type `clean`. You get a response with `DiskPart succeeded in cleaning the
   disk.`.
5. Type `list volume`, followed by `select volume <ID>` where `<ID>` corresponds
   to your SD-card drive.
6. Type `convert mbr`. You should get the response `DiskPart successfully
   converted the selected disk to MBR format.`.
7. Type `create partition primary`. The response should be `DiskPart succeeded
   in creating the specified partition.`.
8. Finally, type `format fs=fat32 quick label="P2000T"`, after which the
   response is `DiskPart successfully formatted the volume.`.

Your SD-card should now be ready to work in the SD-cartridge. Of course, you
still need to copy files to it in order to load something of it.
