# OpenVPN SOCKS5 Proxy

Docker container to connect to an OpenVPN network. The network is exposed to your host PC using SOCKS5 proxy.

---

## Setup

Build the container

	./build.sh

## Usage

Place your OpenVPN config file in the `./config/` directory.

Start the container (Host PC)

	./start.sh

Launch your OpenVPN config file (inside container)

	launch *.ovpn

***On your host PC, access the network using SOCKS5 proxy on port 9050***

Halt your OpenVPN instance (inside container)
	
	halt

Stop the container (Host PC)

	./stop.sh

---

## Implementation

The container simply has an OpenVPN installation and a network interface `tap0` for it.

[Dante SOCKS Server](https://www.inet.no/dante/) is used. It listens on `eth0` (the network from the host PC) and connects to this `tap0` network (the OpenVPN network).


## Notice

Test if it work on your **host**

	curl --socks5 localhost:9050 http://ipinfo.io/

If you can't find `danted` process in the `ps -ef` inside container

* **either** check the [syslog](https://stackoverflow.com/questions/10979435/where-does-linux-store-my-syslog)

* **or** change `logoutput` in `/etc/danted.conf` to a location you can locate easily, such as `/var/log/danted/danted.log`(you need to make sure the directory exists)

If you find something such as `unresolved host tap0` in your `danted` process's log

* after setup your vpn connection, run `ifconfig` to check your interface's name, mine is `tun0`, replace the `tap0` by your interface name

If you can't find `openvpn` process in the `ps -ef` inside container

* run `openvpn --config *.ovpn` manually to see what's going on, it may be caused by wrong password or wrong server configuration

`openvpn` connected successfully but `danted` need to be started manually

* For thoese who need manually enter the username and password, 3 seconds may not enough, change `sleep 3` to `sleep 60` in `Dockerfile` before `build`, or change it in `~/.bashrc` manually



