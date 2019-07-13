#!/bin/bash

NAME="openvpn_holder"
docker exec -it \
	$NAME \
	/bin/bash -c 'cd /etc/openvpn; exec "${SHELL:-sh}"'
