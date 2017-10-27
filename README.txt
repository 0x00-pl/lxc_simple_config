create network forward for container and forward port 80 to container.

1. link interfaces to /etc/network/interfaces.d
   ln -s interfaces /etc/network/interfaces.d/lxcbr0

2. check pre-start.sh . it will add rules into iptables.
3. check post-stop.sh . it will remove rules from iptables.
4. include config.merge in config . it will config network and triger pre-start.sh and post-stop.sh.
   echo "lxc.include = /var/lib/lxc/{{your container name}}/config.network" >> config


cgroups config example:
   lxc.cgroup.cpuset.cpus = 0,1
   lxc.cgroup.cpu.shares = 1234
   lxc.cgroup.devices.deny = a
   lxc.cgroup.devices.allow = c 1:3 rw
   lxc.cgroup.devices.allow = b 8:0 rw

for more in cgroup:
  http://man7.org/linux/man-pages/man7/cgroups.7.html
  https://wiki.archlinux.org/index.php/Cgroups
  https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/resource_management_guide/ch01

export and import:
  # lxc-stop -n $NAME
  # cd /var/lib/lxc/$NAME/
  # tar --numeric-owner -czvf container_fs.tar.gz ./*

  copying to new machine
  # rsync -avh container_fs.tar.gz user@newserver:/var/lib/lxc/

  on new machine
  # mkdir /var/lib/lxc/$NAME/
  # cd /var/lib/lxc/$NAME/
  # tar --numeric-owner -xzvf container_fs.tar.gz .

  https://stackoverflow.com/questions/23427129/how-do-i-backup-move-lxc-containers
