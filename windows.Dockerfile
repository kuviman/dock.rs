FROM rust:slim

RUN apt-get update && apt-get install -y ssh git curl wget zip unzip pkg-config libssl-dev make && apt-get install -y mingw-w64

RUN rustup target add x86_64-pc-windows-gnu
COPY windows.cargo-config $HOME/.cargo/config

COPY scripts /opt/scripts
