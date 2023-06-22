#!/bin/bash

# 1. Membuat Docker image
docker build -t shipping-service:v1 .

# 2. Melihat daftar image di lokal
docker images

# 3. Mengubah nama image
docker tag shipping-service:v1 rizkisetyawan/shipping-service:v1

# 4. Login ke Docker Hub
# echo $PASSWORD_DOCKER_HUB | docker login -u rizkisetyawan --password-stdin
docker login
# 5. Mengunggah image ke Docker Hub
docker push rizkisetyawan/shipping-service:v1