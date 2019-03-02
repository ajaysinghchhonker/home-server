#!/bin/bash

echo "formating drive sdd"

(
  echo o # Create a new empty DOS partition table
  echo n # Add a new partition
  echo p # Primary partition
  echo 1 # Partition number
  echo   # First sector (Accept default: 1)
  echo   # Last sector (Accept default: varies)
  echo w # Write changes
) | sudo fdisk /dev/sdd > /dev/null

sudo mkfs -t ext4 /dev/sdd1 > /dev/null
