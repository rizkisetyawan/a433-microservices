# Menggunakan gambar Docker yang berasal dari node:18-alpine
FROM node:18-alpine

# Mengatur direktori kerja di dalam kontainer
WORKDIR /src

# Menyalin file package.json dan package-lock.json dari direktori host ke direktori kontainer
COPY package*.json ./

# Menginstal Bash di dalam kontainer
RUN apk add --no-cache bash

# Mengunduh skrip wait-for-it.sh dan memberikan izin eksekusi di dalam kontainer
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# Menginstal dependensi yang didefinisikan dalam package.json
RUN npm install

# Menyalin file-file dengan ekstensi .js dari direktori host ke direktori kontainer
COPY ./*.js ./

# Mengatur variabel lingkungan PORT dengan nilai 3000
ENV PORT=3001

# Mendefinisikan port yang akan didengarkan oleh kontainer
EXPOSE $PORT

# Menentukan perintah yang akan dijalankan secara default saat kontainer dimulai
CMD ["npm", "start"]