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

# Menginstal dependencies untuk production dan kemudian build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port 8080 di dalam container agar dapat diakses dari luar
EXPOSE 8080

# Menjalankan perintah npm start saat container dijalankan
CMD ["npm", "start"]
