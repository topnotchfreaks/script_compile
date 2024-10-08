#!/bin/bash

WORK_DIR=$(pwd)
KERNEL_DIR="kernel_msm-5.15"
KERN_IMG=$WORK_DIR/out/android13-5.15/dist/Image

# setup color
red='\033[0;31m'
green='\e[0;32m'
white='\033[0m'
yellow='\033[0;33m'

function cleanup() {
    echo -e "\n"
    echo -e "$yrllow << Cleaning Up! >> \n$white"
    echo -e "\n"

    rm -rf out/
    rm -rf logs

    echo -e "\n"
    echo -e "$yrllow << Cleaned! >> \n$white"
    echo -e "\n"
}


function build_kernel() {
    echo -e "\n"
    echo -e "$yrllow << building kernel >> \n$white"
    echo -e "\n"

    cd $WORK_DIR
    LTO=thin BUILD_CONFIG=$KERNEL_DIR/build.config.gki.aarch64 build/build.sh

    if [ -e "$KERN_IMG" ]; then
        echo -e "\n"
        echo -e "$green << compile kernel success! >> \n$white"
        echo -e "\n"
    else
        echo -e "\n"
        echo -e "$red << compile kernel failed! >> \n$white"
        echo -e "\n"
    fi
}

cleanup
build_kernel
