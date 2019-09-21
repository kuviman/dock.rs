FROM rust:slim AS default
RUN apt-get update && apt-get install -y ssh git curl wget zip unzip pkg-config libssl-dev make libasound2-dev libgtk-3-dev
COPY scripts /opt/scripts

FROM default AS web
COPY install-cargo-web.sh /tmp/
RUN rustup target add wasm32-unknown-unknown && bash /tmp/install-cargo-web.sh && rm /tmp/install-cargo-web.sh

FROM default AS windows
RUN apt-get install -y mingw-w64
RUN rustup target add x86_64-pc-windows-gnu
COPY windows.cargo-config $HOME/.cargo/config

FROM default as macos
COPY install-osxcross.sh /tmp
RUN sh /tmp/install-osxcross.sh
ENV PATH=$PATH:/tmp/osxcross/target/bin
RUN rustup target add x86_64-apple-darwin
COPY macos.cargo-config $HOME/.cargo/config