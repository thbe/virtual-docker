### Dockerfile
#
# VERSION:
#   1.0
#
# DESCRIPTION:
#   Create Ubuntu 16.04 docker base image with Puppet
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/ubuntu16.04/Dockerfile
#   docker build --rm -t local/ubuntu16.04 .
#
# USAGE:
#   docker run --rm -ti local/ubuntu16.04 /bin/bash
#

# Smallest base image, just to launch a container
FROM ubuntu:16.04
ENV container docker
MAINTAINER Thomas Bendler, project@bendler-net.de

# Set locale to en_US.utf-8
ENV LANG en_US.UTF-8
ENV TERM xterm

# Add additional repositories
ADD https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb /tmp/puppetlabs-release-pc1-xenial.deb
RUN dpkg -i /tmp/puppetlabs-release-pc1-xenial.deb

# Update base image
RUN apt clean all
RUN apt -y dist-upgrade && apt clean all

# Prepare base image with standard tools
RUN apt -y install vim curl wget && apt clean all

# Install puppet
RUN apt -y install puppet-agent && apt clean all

# Finish build
RUN echo "Installation of Puppet and common tools finished!"
RUN echo "Docker container ready for action ..."
