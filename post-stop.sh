#!/bin/sh
iptables -t nat -D PREROUTING -p tcp -m tcp --dport $2 -j DNAT --to $1
iptables -t nat -D POSTROUTING -s $1/24 -j MASQUERADE
