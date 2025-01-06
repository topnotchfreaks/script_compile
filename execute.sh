#!/bin/bash

WORK_DIR=$(pwd)
KERNEL_DIR="msm-5.15"

cd $WORK_DIR
LTO=thin BUILD_CONFIG=$KERNEL_DIR/build.config.msm.bengal build/build.sh
