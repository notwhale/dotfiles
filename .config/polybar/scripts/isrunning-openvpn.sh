#!/bin/sh

connection=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | sed -e 's/\.[^.]*$//')

if [ -n "$connection" ]; then
    echo "VPN: $connection"
else 
    echo ""
fi
