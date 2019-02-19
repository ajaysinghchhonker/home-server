#!/bin/bash

rm -rf /out/server/storage
mkdir -p /opt/server/storage
sudo mount /dev/sdb1 /opt/server/storage
sudo chown -R $USER:$USER /opt/server/storage
