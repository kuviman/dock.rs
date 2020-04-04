FROM rust:slim-stretch
RUN apt-get update && apt-get install -y \
    ssh git curl wget zip unzip pkg-config \
    libssl-dev make cmake libasound2-dev libgtk-3-dev jq