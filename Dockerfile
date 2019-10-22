FROM rust:slim-stretch AS default
RUN apt-get update && apt-get install -y ssh git curl wget zip unzip pkg-config libssl-dev make cmake libasound2-dev libgtk-3-dev jq
COPY scripts /opt/scripts

FROM default AS musl
RUN apt-get install -y musl
ENV PKG_CONFIG_ALLOW_CROSS=1
RUN rustup target add x86_64-unknown-linux-musl

FROM default AS web
COPY install-cargo-web.sh /tmp/
RUN rustup target add wasm32-unknown-unknown && bash /tmp/install-cargo-web.sh && rm /tmp/install-cargo-web.sh

FROM default AS windows
RUN apt-get install -y mingw-w64
RUN rustup target add x86_64-pc-windows-gnu
# https://github.com/msys2/MINGW-packages/issues/4133, https://github.com/rust-lang/rust/issues/47048
RUN cp /usr/x86_64-w64-mingw32/lib/crt2.o /usr/local/rustup/toolchains/*-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-pc-windows-gnu/lib/ && \
    cp /usr/x86_64-w64-mingw32/lib/dllcrt2.o /usr/local/rustup/toolchains/*-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-pc-windows-gnu/lib/ && \
    cp /usr/x86_64-w64-mingw32/lib/libmingwex.a /usr/local/rustup/toolchains/*-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-pc-windows-gnu/lib/ && \
    cp /usr/x86_64-w64-mingw32/lib/libmsvcrt.a /usr/local/rustup/toolchains/*-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-pc-windows-gnu/lib/
COPY windows.cargo-config $HOME/.cargo/config

FROM rust:slim AS default
RUN apt-get update && apt-get install -y ssh git curl wget zip unzip pkg-config libssl-dev make cmake libasound2-dev libgtk-3-dev jq
COPY scripts /opt/scripts
RUN apt-get install -y clang libxml2-dev
COPY install-osxcross.sh /tmp
RUN sh /tmp/install-osxcross.sh
ENV PATH=$PATH:/tmp/osxcross/target/bin
ENV LIBZ_SYS_STATIC=1
ENV CC=o64-clang
ENV CXX=o64-clang++
RUN rustup target add x86_64-apple-darwin
COPY macos.cargo-config $HOME/.cargo/config