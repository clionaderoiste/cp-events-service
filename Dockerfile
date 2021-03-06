FROM mhart/alpine-node:0.10
MAINTAINER nearForm <info@nearform.com>

#RUN apk-install git make gcc g++ python postgresql-client
RUN apk-install git 
  
RUN mkdir -p /usr/src/app /usr/src/app/lib /usr/src/app/config /usr/src/app/scripts
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install --production && rm -rf /root/.npm
COPY config /usr/src/app/config/
COPY scripts /usr/src/app/scripts/
COPY lib /usr/src/app/lib/
COPY *.js /usr/src/app/  
