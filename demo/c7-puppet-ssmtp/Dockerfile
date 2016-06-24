### Dockerfile
#
# VERSION:
#   1.0
#
# DESCRIPTION:
#   Create CentOS Linux 7 docker image with Puppet thbe-ssmtp module
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#   You need to build base/centos7 first, see:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/centos7/Dockerfile
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/demo/c7-puppet-ssmtp/Dockerfile
#   docker build --rm -t local/c7-puppet-ssmtp .
#
# USAGE:
#   docker run --rm -ti local/c7-puppet-ssmtp puppet-ssmtp /bin/bash
#

# Use local centos7 build from base/centos7
FROM local/centos7
MAINTAINER Thomas Bendler, project@bendler-net.de

### Install thbe-ssmtp ###
RUN puppet module install thbe-ssmtp
RUN puppet apply -e 'class { "ssmtp": }'

### Show demo results ###
RUN echo "Puppet installed ssmtp and switched the default mta:"
RUN ls -alFh /usr/sbin/sendmail
RUN ls -alFh /etc/alternatives/mta
