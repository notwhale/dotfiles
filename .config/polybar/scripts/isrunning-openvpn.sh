#!/bin/sh

if [ "$(pgrep openvpn)" ]; then
    echo "  VPN on"
else
    echo "  VPN off"
fi
