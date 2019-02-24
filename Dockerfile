FROM rust:slim

RUN apt-get update && apt-get install -y ssh git curl wget zip unzip

COPY scripts /opt/scripts
