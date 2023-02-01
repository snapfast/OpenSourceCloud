inodes

#### init
this is the first thing that executes when a system runs.

#### systemd
systemd is a software suite that provides an array of system components for Linux operating systems.
systemd-resolved is service running for handling local dns caching on linux machines.

users of system  
`cat /etc/passwd`

groups of system  
`cat /etc/group`

list block devices
`lsblk`

info commands
```
man
info
man -k 'search words'
```

```

repoquery
rpm -ua <>
rpm -ul 'search word related services'

top
top -M


```



ufw - program for managing a netfilter firewall
```
sudo ufw enable                          ## by default it blocks all incoming traffic
sudo ufw status verbose
sudo ufw status numbered
sudo ufw allow ftp
sudo ufw allow 81
sudo ufw delete <number>
sudo ufw allow 1.1.1.1/24
sudo --dry-run
```

journalctl - Query the systemd journal
```
journalctl -n
journalctl -u <word>
```

what is user made of?

/proc -- what is it? how it is useful ?


DHCP leases IP addresses from a network range already assigned to it. New computer requests IP address from the DHCP server,


DNS
Host checks its internal DNS cache if the url is not found.
It goes to the ISP DNS server (resolver server) which checks its own cache DNS memory, if not found.
It goes to Root servers . These servers help resolve the DN. There are 13 servers strategiically placed around the world. Top of the DNS hierarchy, operated by 12 different organizations around the world.
It sends the resolver to the TLD server (top level domain server). TLD server stores the informations about the Authoritrative name servers. TLD servers responds with a Authoritative named server. Resolvers will get the IP address  from the ANS server. ISP DNS server stores the result upon the successful resolution of DN.


> troubleshooting --
login to a machine -- seeing unknown process name -- how do you approach ?

`htop` - files/ resource usage
find its binary and configuration
what is it doing in the proc


find processes which have open files in the system.
```
fuser
lsof
```


---

IP address information
```
ifconfig
ip addr show
```

Network Management IP Tables

`ip route`


Kernel version and release

`uname -a`


Detail about your system operating system

`cat /etc/*release`

`neofetch     ## can be installed on most OS`


Check Disk usage

`df -ah`


Check Size of a directory

`du -sh <directory name>`


Check running services, manage

`service <name> status`
`systemctl status <name>`


Check for Open ports / Listening sockets / Network Sockets

`netstat`
`netstat -tupln    ## execute as root to see the program name of the listening ports`


Check CPU usage of the Process name
`ps aux | grep <process name>`
`top    ## dashboard for CPU and RAM utilization, also you can install htop`


Mounting Volumes
```
mount     ## all mounts generally go to /mnt
mount /dev/sda1 /mnt
less /etc/fstab   ## mount of the disks on boot
```


Copy files from/to remote host

```
rsync -av [USER@]HOST::SRC... [DEST]                ## copy file from remote host
rsync -av rsync://[USER@]HOST[:PORT]/SRC... [DEST]  ## send file to remote host (copy)
```

List processes that use specific folders
```
lsof     ## sometimes may not be installed on new systems.
fuser
```

Network details for sockets

`ss`





