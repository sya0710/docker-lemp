FROM node:18-alpine

RUN apk add --no-cache \
  openssh

RUN npm cache clear --force
RUN npm update -g npm
RUN npm install -g npm@9.4.0
RUN npm install -g @angular/cli@15.2.0
RUN npm install -g webpack webpack-cli

WORKDIR /projects/backend

ADD . .

RUN mkdir /build-dir && cp package.json /build-dir/ && cp package-lock.json /build-dir/

WORKDIR /build-dir

RUN npm install --no-bin-links

RUN npm install --save-dev @angular/cli@15.2.0

RUN rm -rf /projects/backend/node_modules

RUN rm -rf /projects/backend/package.json

RUN rm -rf /projects/backend/package-lock.json

RUN cp -r node_modules /projects/backend

RUN cp -r package.json /projects/backend

RUN cp -r package-lock.json /projects/backend
