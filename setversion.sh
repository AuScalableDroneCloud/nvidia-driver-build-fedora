#!/bin/bash

#Utility script to update the kernel and/or nvidia driver versions

OLD_VER=32
VER=35

OLD_KERNEL_VERSION=5.7.16
KERNEL_VERSION=5.15.17

OLD_KERNEL_REV=200
KERNEL_REV=200

OLD_NVIDIA_DRIVER_VERSION=470.57.02
NVIDIA_DRIVER_VERSION=510.47.03

for file in Dockerfile .github/workflows/build.yml README.md
do
  echo $file
  sed -i "s/FEDORA_VERSION=${OLD_VER}/FEDORA_VERSION=${VER}/g" $file
  sed -i "s/fedora${OLD_VER}/fedora${VER}/g" $file
  sed -i "s/${OLD_KERNEL_VERSION}\(.\)${OLD_KERNEL_REV}/${KERNEL_VERSION}\1${KERNEL_REV}/g" $file
  sed -i "s/${OLD_KERNEL_VERSION}/${KERNEL_VERSION}/g" $file
  sed -i "s/${OLD_NVIDIA_DRIVER_VERSION}/${NVIDIA_DRIVER_VERSION}/g" $file
done
