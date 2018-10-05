FROM local/centos7
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/demo/c7-puppet-style/Dockerfile
#   docker build --rm -t local/c7-puppet-style .
#
# USAGE:
#   docker run --rm -ti local/c7-puppet-style puppet-style /bin/bash
#

# Set metadata
LABEL maintainer="Thomas Bendler <project@bendler-net.de>"
LABEL version="1.0"
LABEL description="Create CentOS Linux 7 docker image with Puppet thbe-style module"

# Set environment
ENV container docker
ENV LANG en_US.UTF-8
ENV TERM xterm

### Install thbe-ssmtp ###
RUN puppet module install thbe-style && \
    puppet apply -e 'class { "style": }'
