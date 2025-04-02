# Mengambil base image
FROM node:23.11.0-alpine3.20

# Menentukan work directory
WORKDIR /usr/src/app

# Set Environment
ENV PORT=3000
ENV AMQP_URL=amqp://192.168.151.210:5673

# Menyalin semua file dari lokal direktori ke source direktori /usr/src/app
COPY . .

# Melakukan perintah npm install
RUN npm install

# Mengekspose port agar aplikasi dapat diakses dari luar container
EXPOSE 3000

# Menentukan perintah default yang akan dijalankan ketika container dimulai
CMD [ "npm", "run", "start" ]