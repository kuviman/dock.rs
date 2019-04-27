FROM rust:slim

RUN apt-get update && apt-get install -y ssh git curl wget zip unzip pkg-config libssl-dev make

COPY scripts /opt/scripts
