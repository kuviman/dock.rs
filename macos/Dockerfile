ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN apt-get install -y clang libxml2-dev
COPY install-osxcross.sh /tmp
RUN sh /tmp/install-osxcross.sh
ENV PATH=$PATH:/tmp/osxcross/target/bin
ENV LIBZ_SYS_STATIC=1
ENV CC=o64-clang
ENV CXX=o64-clang++
RUN rustup target add x86_64-apple-darwin
COPY cargo.config $HOME/.cargo/config