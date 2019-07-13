#!/bin/bash
IMAGE="openvpn_holder"
docker stop $IMAGE && docker rm $IMAGE