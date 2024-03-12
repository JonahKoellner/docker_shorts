#!/bin/bash

system=$(uname)
if [ "$system" = "Darwin" ]; then
    # Mac
    echo "[script] Mac System Detected."
    if [ $# -eq 1 ] && [ $1 -eq "42" ]; then
        echo "[script] Starting 42 mac Init in goinfre"
        bash mac/42mac_init.sh
    else
        echo "[open] Opening Docker"
        open -g -a Docker
    fi
elif [ "$system" = "Linux" ]; then
    # Linux
    echo "[script] Linux System Detected."
    echo "[systemctl] Starting Docker daemon..."
    sudo systemctl start docker
fi
