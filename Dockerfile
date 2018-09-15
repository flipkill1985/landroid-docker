#FROM debian
FROM ubuntu:16.04
#FROM smartentry/ubuntu:16.04
#FROM rastasheep/ubuntu-sshd:16.04

MAINTAINER Jan Mohs <jan@mohs.es>

ENV Landroid Version 1.0
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN useradd --create-home -s /bin/bash landroid
WORKDIR /home/landroid
USER landroid

#install dependencies

RUN apt-get update && apt-get upgrade -y --force-yes && apt-get install -y --force-yes --no-install-recommends apt-utils
RUN apt-get -y --force-yes install \
wget \
git \
snmpd \
snmp \
vim \
telnet \
usbutils \
libstdc++6 \
npm \
nodejs-legacy \
net-tools \
telnet

RUN mkdir /opt/landroid && \
    chown root:root /opt/landroid && \
    chmod 777 /opt/landroid && \
    cd /opt/landroid && \
    git clone -b master https://github.com/axelmohnen/fhem-landroid-s.git
COPY /data/LandroidConf.json /opt/landroid/fhem-landroid-s/LandroidConf.json

RUN cd /opt/landroid/fhem-landroid-s && \
    npm install iobroker.landroid-s

#CMD ["nodejs", "/opt/landroid/fhem-landroid-s/LandroidSrv.js"]
#CMD node /opt/landroid/fhem-landroid-s/LandroidSrv.js mower1
ENTRYPOINT [ "nodejs",  "/opt/landroid/fhem-landroid-s/LandroidSrv.js" ]
CMD [ "mower1" ]
