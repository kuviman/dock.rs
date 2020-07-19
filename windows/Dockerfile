ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN apt-get install -y mingw-w64
RUN rustup target add x86_64-pc-windows-gnu
COPY cargo.config $HOME/.cargo/config