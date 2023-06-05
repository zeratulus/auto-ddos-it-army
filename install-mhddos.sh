#!/usr/bin/env bash

sudo apt update -y && sudo apt install --upgrade wget screen -y

cd ~ && wget https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases/releases/latest/download/mhddos_proxy_linux && chmod +x mhddos_proxy_linux

sysctl -w net.ipv4.ip_local_port_range="16384 65535"