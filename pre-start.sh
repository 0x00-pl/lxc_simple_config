#!/bin/sh
iptables -t nat -A PREROUTING -p tcp -m tcp --dport $2 -j DNAT --to $1
iptables -t nat -A POSTROUTING -s $1/24 -j MASQUERADE

