#!/bin/bash

NAME="openvpn_holder"
IMAGE="openvpn_holder"

# Start container (if not already started)
if [ ! "$(docker ps -q -f name=$IMAGE)" ]; then

    docker run \
    --hostname "${NAME}" \
    --name "${NAME}" \
    --privileged \
    --interactive \
    --detach \
    -p 9050:1080 \
    --volume "$(pwd)/config:/etc/openvpn" \
    --volume "$(pwd)/config/danted.conf:/etc/danted.conf" \
    $IMAGE

fi

# Connect to shell
docker exec -it \
	$NAME \
	/bin/bash -c 'cd /etc/openvpn; exec "${SHELL:-sh}"'
