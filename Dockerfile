FROM node:25-trixie

WORKDIR /hscode-ts

RUN apt update && apt full-upgrade -y && apt autoremove -y

VOLUME ["/hscode-ts"]
