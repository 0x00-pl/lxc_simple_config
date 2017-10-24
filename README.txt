create network forward for container and forward port 80 to container.

1. link interfaces to /etc/network/interfaces.d
   ln -s interfaces /etc/network/interfaces.d/lxcbr0

2. check pre-start.sh . it will add rules into iptables.
3. check post-stop.sh . it will remove rules from iptables.
4. merge config.merge to config . it will config network and triger pre-start.sh and post-stop.sh.
