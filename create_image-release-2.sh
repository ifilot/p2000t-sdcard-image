#!/bin/bash

set -e  # Exit on error

# delete any existing files and folders
rm -rf *.img *.zip software-main

# Configuration
IMAGE_NAME="p2000t-sd-card.img"
PARTITION_SIZE="1024MiB"
FILESYSTEM="fat32"
LABEL="P2000T"

# Step 1: Create an empty image file
echo "Creating an empty image file of size $PARTITION_SIZE..."
dd if=/dev/zero of=$IMAGE_NAME bs=1M count=$(echo $PARTITION_SIZE | sed 's/MiB//')

# Step 2: Partition the image
echo "Partitioning the image..."
parted --script $IMAGE_NAME mklabel msdos
parted --script $IMAGE_NAME mkpart primary $FILESYSTEM 1MiB 100%

# Step 3: Associate the image with a loop device
LOOP_DEVICE=$(losetup --show -fP $IMAGE_NAME)
echo "Image attached to loop device: $LOOP_DEVICE"

# Step 4: Format the partition as FAT32
echo "Formatting the partition as FAT32..."
mkfs.vfat -n $LABEL "${LOOP_DEVICE}p1"

# Step 5: Mount and populate partitions
echo "Mounting partitions..."
ROOT_MOUNT=$(mktemp -d)

# Step 6: mount device
mount "${LOOP_DEVICE}p1" $ROOT_MOUNT

# Step 7: Populate the partitions (customize this part as needed)
echo "Populating root partition..."
mkdir -p $ROOT_MOUNT
echo "P2000T SD-card image" > $ROOT_MOUNT/README.txt

wget https://github.com/p2000t/software/archive/refs/heads/main.zip -O repository.zip
unzip -o repository.zip
rm software-main/cassettes/README.md
rm -r software-main/cassettes/__support
cp -r software-main/cassettes/* $ROOT_MOUNT

# download latest firmware (!0x40 variant implied!)
wget https://github.com/ifilot/p2000t-sdcard/releases/download/release-2.x/LAUNCHER.BIN -O $ROOT_MOUNT/LAUNCHER.BIN

# download PRG images - requires fix for release 2.x
# mkdir $ROOT_MOUNT/PRGPROGS
# wget https://github.com/ifilot/p2000t-sdcard-cartridge-programs/releases/download/latest/CASDUMP.PRG -O $ROOT_MOUNT/PRGPROGS/CASDUMP.PRG
# wget https://github.com/ifilot/p2000t-sdcard-cartridge-programs/releases/download/latest/HELLOWORLD.PRG -O $ROOT_MOUNT/PRGPROGS/HELLOWORLD.PRG
# wget https://github.com/ifilot/p2000t-sdcard-cartridge-programs/releases/download/latest/MONCRC16.PRG -O $ROOT_MOUNT/PRGPROGS/MONCRC16.PRG

# Step 8: Cleanup
echo "Unmounting and cleaning up..."
umount $ROOT_MOUNT
losetup -d $LOOP_DEVICE
rmdir $ROOT_MOUNT

# clean up files
rm -rf *.zip software-main

# zip file
zip $IMAGE_NAME.zip $IMAGE_NAME

echo "SD card image creation completed: $IMAGE_NAME"