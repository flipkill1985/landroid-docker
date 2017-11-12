# landroid-docker
Dockerfile for Landroid-S Worx Mower
NPM From https://github.com/axelmohnen/fhem-landroid-s.git

1. Clone git Repository
2. Edit /data/LandroidConf.json with your Account Data
"email": "xxx",
"pwd": "xxx",
3. Use docker.compose File or docker build .

Example docker-compose:
<p>version: '2'<br />services:<br /> landroid:<br /> build: landroid <br /> restart: always<br /> image: landroid<br /> expose:<br /> - "8001"<br /> ports:<br /> - "8001:8001"<br /> networks:<br /> - code-network</p>
