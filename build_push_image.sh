#!/bin/bash

# 1. Membuat Docker image
docker build -t item-app:v1 .

# 2. Melihat daftar image di lokal
docker images

# 3. Mengubah nama image
docker tag item-app:v1 rizkisetyawan/item-app:v1

# 4. Login ke Docker Hub
echo $PASSWORD_DOCKER_HUB | docker login -u rizkisetyawan --password-stdin

# 5. Mengunggah image ke Docker Hub
docker push rizkisetyawan/item-app:v1