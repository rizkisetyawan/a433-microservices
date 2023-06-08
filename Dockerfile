# Menggunakan base image Node.js versi 14 yang berbasis Alpine Linux yang ringan
FROM node:14-alpine

# Menginstall dependensi python2, g++, dan make yang diperlukan untuk beberapa modul Node.js
RUN apk add --no-cache python3 g++ make

# Menetapkan working directory di dalam container ke /app
WORKDIR /app

# Menyalin seluruh konten dari direktori sumber ke working directory di dalam container
COPY . .

# Mengatur variabel lingkungan NODE_ENV sebagai production dan DB_HOST sebagai item-db
ENV NODE_ENV=production
ENV DB_HOST=item-db

# Menginstal dependensi aplikasi menggunakan Yarn package manager dengan opsi --production
RUN yarn install --production

# Menjalankan perintah node ./bin/www saat container dijalankan
CMD ["node", "./bin/www"]

# Mengekspos port 3000 di dalam container agar dapat diakses dari luar
EXPOSE 3000
