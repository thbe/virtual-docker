FROM local/centos7
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/demo/c7-puppet-ssmtp/Dockerfile
#   docker build --rm -t local/c7-puppet-ssmtp .
#
# USAGE:
#   docker run --rm -ti local/c7-puppet-ssmtp puppet-ssmtp /bin/bash
#

# Set metadata
LABEL maintainer="Thomas Bendler <project@bendler-net.de>"
LABEL version="1.0"
LABEL description="Create CentOS Linux 7 docker image with Puppet thbe-ssmtp module"

# Set environment
ENV container docker
ENV LANG en_US.UTF-8
ENV TERM xterm

### Install thbe-ssmtp ###
RUN puppet module install thbe-ssmtp && \
    puppet apply -e 'class { "ssmtp": }' && \
    echo "Puppet installed ssmtp and switched the default mta:" && \
    ls -alFh /usr/sbin/sendmail && \
    ls -alFh /etc/alternatives/mta
