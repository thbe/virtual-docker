FROM alpine:latest
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/alpine/Dockerfile
#   docker build --rm -t local/alpine .
#
# USAGE:
#   docker run --rm -ti local/alpine /bin/sh
#

# Set metadata
LABEL maintainer="Thomas Bendler <project@bendler-net.de>"
LABEL version="1.0"
LABEL description="Creates an Alpine latest container"

# Set environment
ENV LANG en_US.UTF-8
ENV TERM xterm

# Switch image to edge
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk upgrade
