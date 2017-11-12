# landroid-docker
Dockerfile for Landroid-S Worx Mower

1. Clone git Repository
2. Edit /data/LandroidConf.json with your Account Data
   "email": "xxx",
   "pwd": "xxx",
3. Use docker.compose File or docker build .

Example docker-compose:

version: '2'
services:
  landroid:
  build: landroid     
  restart: always
    image: landroid
    expose:
      - "8001"
    ports:
      - "8001:8001"
    networks:
      - code-network
