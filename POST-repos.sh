#!/bin/bash

# POST-repos.sh by static0verdrive
## https://github.com/static0verdrive/nexus

# Nexus Instance & Credentials
IP="192.168.1.5"
PORT="8081"
USERNAME="admin"
PASSWORD="WebGUIPasswordHere"

# APT Repo Proxies
curl -u ${USERNAME}:${PASSWORD} -X POST "http://${IP}:${PORT}/service/rest/v1/repositories/apt/proxy" -H "Content-Type: application/json" -d @apt/proxy/apt-repo.json
curl -u ${USERNAME}:${PASSWORD} -X POST "http://${IP}:${PORT}/service/rest/v1/repositories/apt/proxy" -H "Content-Type: application/json" -d @apt/proxy/apt-salt.json

# Docker Hub Proxy
curl -u ${USERNAME}:${PASSWORD} -X POST "http://${IP}:${PORT}/service/rest/v1/repositories/docker/proxy" -H "Content-Type: application/json" -d @docker/proxy/docker.json

# Raw HTTP filesystems
curl -u ${USERNAME}:${PASSWORD} -X POST "http://${IP}:${PORT}/service/rest/v1/repositories/raw/hosted" -H "Content-Type: application/json" -d @raw/hosted/cloud-init.json
curl -u ${USERNAME}:${PASSWORD} -X POST "http://${IP}:${PORT}/service/rest/v1/repositories/raw/hosted" -H "Content-Type: application/json" -d @raw/hosted/vagrant.json

# Proxy of Saltstack Raw HTTP filesystem
curl -u ${USERNAME}:${PASSWORD} -X POST "http://${IP}:${PORT}/service/rest/v1/repositories/raw/proxy" -H "Content-Type: application/json" -d @raw/proxy/saltstack.json

# YUM/DNF Repo Proxies
curl -u ${USERNAME}:${PASSWORD} -X POST "http://${IP}:${PORT}/service/rest/v1/repositories/yum/proxy" -H "Content-Type: application/json" -d @yum/proxy/yum-repo.json
curl -u ${USERNAME}:${PASSWORD} -X POST "http://${IP}:${PORT}/service/rest/v1/repositories/yum/proxy" -H "Content-Type: application/json" -d @yum/proxy/yum-epel.json
curl -u ${USERNAME}:${PASSWORD} -X POST "http://${IP}:${PORT}/service/rest/v1/repositories/yum/proxy" -H "Content-Type: application/json" -d @yum/proxy/yum-salt.json
