#!/bin/bash

echo "formating drive sdb"

(
  echo o # Create a new empty DOS partition table
  echo n # Add a new partition
  echo p # Primary partition
  echo 1 # Partition number
  echo   # First sector (Accept default: 1)
  echo   # Last sector (Accept default: varies)
  echo w # Write changes
) | sudo fdisk /dev/sdb > /dev/null

sudo mkfs -t ext4 /dev/sdb1 > /dev/null
