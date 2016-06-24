### Dockerfile
#
# VERSION:
#   1.0
#
# DESCRIPTION:
#   Create CentOS Linux 7 docker image with Puppet thbe-style module
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#   You need to build base/centos7 first, see:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/centos7/Dockerfile
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/demo/c7-puppet-style/Dockerfile
#   docker build --rm -t local/c7-puppet-style .
#
# USAGE:
#   docker run --rm -ti local/c7-puppet-style puppet-style /bin/bash
#

# Use local centos7 build from base/centos7
FROM local/centos7
MAINTAINER Thomas Bendler, project@bendler-net.de

### Install thbe-ssmtp ###
RUN puppet module install thbe-style
RUN puppet apply -e 'class { "style": }'

### Show demo results ###
RUN echo "Puppet installed style"
