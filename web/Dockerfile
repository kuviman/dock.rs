FROM ${MAIN_IMAGE}

RUN rustup target add wasm32-unknown-unknown
COPY install-cargo-web.sh /tmp/
RUN bash /tmp/install-cargo-web.sh && rm /tmp/install-cargo-web.sh