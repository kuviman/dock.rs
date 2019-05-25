FROM rust:slim AS default
RUN apt-get update && apt-get install -y ssh git curl wget zip unzip pkg-config libssl-dev make libasound2-dev
COPY scripts /opt/scripts

FROM default AS web
COPY install-cargo-web.sh /tmp/
RUN rustup target add wasm32-unknown-unknown && sh /tmp/install-cargo-web.sh && rm /tmp/install-cargo-web.sh

FROM default AS windows
RUN apt-get install -y mingw-w64
RUN rustup target add x86_64-pc-windows-gnu
COPY windows.cargo-config $HOME/.cargo/config
