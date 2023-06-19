#!/bin/bash

# Nama pengguna Docker Hub atau GitHub Package Registry
username_docker=rizkisetyawan

# Build Docker image untuk backend
docker build -t $username_docker/karsajobs:latest .

# Login ke Docker Hub
echo $PASSWORD_DOCKER_HUB | docker login -u rizkisetyawan --password-stdin

# Push image ke Docker Hub
docker push $username_docker/karsajobs:latest