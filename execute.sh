#!/bin/bash

WORK_DIR=$(pwd)
KERNEL_DIR="msm-5.15"
KERN_IMG=$WORK_DIR/out/android13-5.15/dist/Image

cd $WORK_DIR
LTO=thin BUILD_CONFIG=$KERNEL_DIR/build.config.gki.aarch64 build/build.sh
