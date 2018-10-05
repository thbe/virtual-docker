FROM centos:6
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/centos6/Dockerfile
#   docker build --rm -t local/centos6 .
#
# USAGE:
#   docker run --rm -ti local/centos6 /bin/bash
#

# Set metadata
LABEL maintainer="Thomas Bendler <project@bendler-net.de>"
LABEL version="1.0"
LABEL description="Creates an CentOS 6 docker base image with Puppet"

# Set environment
ENV container docker
ENV LANG en_US.UTF-8
ENV TERM xterm

# Add additional repositories, update base image, install standard tools and install Puppet
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm && \
    rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm && \
    yum -y update && \
    yum -y install curl net-tools tar puppet-agent && \
    yum clean all
