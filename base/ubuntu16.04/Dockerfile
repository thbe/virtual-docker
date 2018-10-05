FROM ubuntu:16.04
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/centos7/Dockerfile
#   docker build --rm -t local/centos7 .
#
# USAGE:
#   docker run --rm -ti local/centos7 /bin/bash
#

# Set metadata
LABEL maintainer="Thomas Bendler <project@bendler-net.de>"
LABEL version="1.0"
LABEL description="Create Ubuntu 16.04 docker base image with Puppet"

# Set environment
ENV container docker
ENV LANG en_US.UTF-8
ENV TERM xterm

# Add additional repositories, update base image, install standard tools and install Puppet
ADD https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb /tmp/puppetlabs-release-pc1-xenial.deb
RUN dpkg -i /tmp/puppetlabs-release-pc1-xenial.deb && \
    apt update && apt -y dist-upgrade && \
    apt -y install curl puppet-agent && \
    apt clean all
