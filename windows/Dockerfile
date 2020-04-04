FROM ${MAIN_IMAGE}

RUN apt-get update && apt-get install -y ssh git curl wget zip unzip pkg-config libssl-dev make cmake libasound2-dev libgtk-3-dev jq
COPY scripts /opt/scripts
RUN apt-get install -y mingw-w64
RUN rustup target add x86_64-pc-windows-gnu
# https://github.com/msys2/MINGW-packages/issues/4133, https://github.com/rust-lang/rust/issues/47048
RUN cp /usr/x86_64-w64-mingw32/lib/crt2.o /usr/local/rustup/toolchains/*-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-pc-windows-gnu/lib/ && \
    cp /usr/x86_64-w64-mingw32/lib/dllcrt2.o /usr/local/rustup/toolchains/*-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-pc-windows-gnu/lib/ && \
    cp /usr/x86_64-w64-mingw32/lib/libmingwex.a /usr/local/rustup/toolchains/*-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-pc-windows-gnu/lib/ && \
    cp /usr/x86_64-w64-mingw32/lib/libmsvcrt.a /usr/local/rustup/toolchains/*-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-pc-windows-gnu/lib/
COPY cargo.config $HOME/.cargo/config