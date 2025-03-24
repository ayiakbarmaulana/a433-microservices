#! /bin/sh

set -e # Menghentikan skrip jika terjadi error

# Melakukan pengecekan arguments, apakah saya menyertakan arguments untuk kebutuhan tagging pada image untuk kebutuhan step berikutnya
# if [ -z "$1" ]; then
#     echo "Tag harus diberikan sebagai argument"
#     echo "Usage $0 <tag>"
#     exit 1
# fi

# Melakukan pengecekan personal access token yang sebelumnya sudah saya export pada local host
if [ -z "$CR_PAT" ]; then
    echo "Error: CR_PAT tidak ditemukan. Pastikan variabel environment sudah diatur."
    exit 1
fi

# Deklarasi variable TAG
# TAG=$1 
TAG=latest

# Melakukan proses build, mengacu pada file Dockerfile dengan nama image ayiakbarmaulana/karsajobs:$TAG 
docker build -t ayiakbarmaulana/karsajobs:$TAG .

# Mengubah nama image / repository, disesuaikan dengan name repository ghcr.io atau github packages
docker tag ayiakbarmaulana/karsajobs:$TAG ghcr.io/ayiakbarmaulana/karsajobs:$TAG

# Melakukan login pada ghcr.io dengan menggunakan personal access token yang sudah saya buat pada account github saya
echo $CR_PAT | docker login ghcr.io -u ayiakbarmaulana --password-stdin

# Melakukan proses push images 
docker push ghcr.io/ayiakbarmaulana/karsajobs:$TAG

# Print Job Succeeded jika semua step sudah berhasil dilaksanakan
echo "✅ Job succeeded"
