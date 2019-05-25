FROM rust:slim

RUN apt-get update && apt-get install -y ssh git curl wget zip unzip pkg-config libssl-dev make libasound2-dev

COPY scripts /opt/scripts
