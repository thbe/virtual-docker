### Dockerfile
#
# VERSION:
#   1.0
#
# DESCRIPTION:
#   Create CentOS Linux 6 docker base image with Puppet and EPEL
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/centos6/Dockerfile
#   docker build --rm -t local/centos6 .
#
# USAGE:
#   docker run --rm -ti local/centos6 /bin/bash
#

# Smallest base image, just to launch a container
FROM centos:6
MAINTAINER Thomas Bendler, project@bendler-net.de

# Include prepare script
ADD https://raw.githubusercontent.com/thbe/virtual-docker/master/scripts/puppet.sh /puppet.sh

# Run prepare script
RUN chmod 755 /puppet.sh
RUN /puppet.sh
