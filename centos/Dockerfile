### Dockerfile
#
# VERSION:
#   0.5
#
# DESCRIPTION:
#   Create CentOS Linux 6.5 with Puppet and EPEL for tests
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#
# USAGE:
#   wget https://raw2.github.com/thbe/virtual-docker/master/centos/Dockerfile
#   docker build -t="thbe/centos6p" -rm .
#   docker run -name centos6-puppet thbe/centos6p -rm -t -i /bin/bash
#

# Smallest base image, just to launch a container
FROM thbe/centos:6.5
MAINTAINER Thomas Bendler, project@bendler-net.de

# Include prepare script
ADD https://raw2.github.com/thbe/virtual-docker/master/scripts/puppet.sh /puppet.sh

# Run prepare script
RUN /puppet.sh
