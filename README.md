# Landroid Worx Docker 
  - Clone git Repository
  - Edit /data/LandroidConf.json with your Account Data "email": "xxx", "pwd": "xxx",
  - Use docker.compose File or docker build .

# Example docker-compose:

```sh
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
```
