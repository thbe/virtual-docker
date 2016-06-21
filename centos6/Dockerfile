### Dockerfile
#
# VERSION:
#   1.0
#
# DESCRIPTION:
#   Create CentOS Linux 6 with Puppet and EPEL for tests
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#
# USAGE:
#   wget https://raw2.github.com/thbe/virtual-docker/master/centos6/Dockerfile
#   docker build -t="local/centos6" .
#   docker run -t -i local/centos6 /bin/bash
#

# Smallest base image, just to launch a container
FROM centos:6
MAINTAINER Thomas Bendler, project@bendler-net.de

# Include prepare script
ADD https://raw2.github.com/thbe/virtual-docker/master/scripts/puppet.sh /puppet.sh

# Run prepare script
RUN chmod 755 /puppet.sh
RUN /puppet.sh
