# syntax=docker/dockerfile:1.4

FROM alpine

# install minio client
RUN apk update && apk add --no-cache \
	wget ca-certificates bash

RUN cd /usr/local/bin && \
  wget -q --show-progress https://dl.min.io/client/mc/release/linux-amd64/mc && \
  chmod +x mc

