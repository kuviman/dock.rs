FROM rust:slim

RUN apt-get update && apt-get install -y ssh git curl wget zip unzip
RUN rustup target add wasm32-unknown-unknown && cargo install cargo-web

COPY scripts /opt/scripts
