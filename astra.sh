#!/bin/sh

CFGDIR=/etc/astra
INITD=/etc/init.d/astra
BINFILE=/usr/bin/astra

if [ $(id -u) != "0" ]; then
    echo "Необходимо делать эту операцию только из root"
    exit 1
fi

mkdir -p /etc/astra

echo "SCRIPT SETUP ASTRA BY artem2135468792580"
echo "SETUP FREE ASTRA"

wget -q -O $INITD http://cesbo.com/download/astra/scripts/init-d.sh
chmod +x $INITD

wget -q -O $BINFILE http://cesbo.com/download/astra/4.4.182/free/x86/linux-64bit/astra
chmod +x $BINFILE
echo "установлено $($BINFILE -v)"

read -p "запускать астру при загрузке сервера? [y/N] " YN <&2
if [ -n "$YN" ]; then
    if [ "$YN" = "y" -o "$YN" = "Y" ]; then
        update-rc.d astra defaults
    fi
fi
