#!/bin/sh

UNIT="tftpd.service"

journalctl --follow -o cat --unit $UNIT | while read -r; do
	if [ "$(systemctl is-active "$UNIT")" = "active" ]; then
        echo " tftp"
    else
        echo " tftp "
    fi
done
