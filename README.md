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