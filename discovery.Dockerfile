FROM golang:1.12-alpine

WORKDIR /app

RUN apk add --update \
    curl \
  && rm -rf /var/cache/apk/*

RUN curl -sL https://github.com/bilibili/discovery/releases/download/v1.1.0/discovery_1.1.0_Linux_x86_64.tar.gz | tar xzv
RUN mv discovery /usr/local/bin
COPY configs/discovery-example.toml discovery-example.toml
CMD discovery -conf discovery-example.toml
