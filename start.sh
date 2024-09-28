#!/bin/bash

set -e
#Credit to Meghthedev for the initial script 

# init
repo init --depth 1 -u https://github.com/LineageOS/android.git -b lineage-17.1 --depth=1

# Run inside foss.crave.io devspace
# Remove existing local_manifests
crave run --clean --no-patch -- "rm -rf .repo/local_manifests && \

# sync repo
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags && \ 

# sync tree
git clone https://github.com/topnotchfreaks/device_xiaomi_fog -b lineage-10 device/xiaomi/fog && \

# Set up build environment
source build/envsetup.sh && \

# Lunch configuration
lunch lineage_fog-userdebug && \

# Build the ROM
mka bacon"

# Pull generated zip files
crave pull out/target/product/*/*.zip
