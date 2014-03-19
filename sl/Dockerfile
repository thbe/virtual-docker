### Dockerfile
#
# VERSION:
#   0.9
#
# DESCRIPTION:
#   Create Scientific Linux 6.5 with Puppet and EPEL for testing Puppet modules
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#
# USAGE:
#   wget https://raw2.github.com/thbe/virtual-docker/master/sl/Dockerfile
#   docker build -t="thbe/slc6p" .
#   docker run -t -i thbe/slc6p /bin/bash
#

# Smallest base image, just to launch a container
FROM thbe/slc:6.5
MAINTAINER Thomas Bendler, project@bendler-net.de

# Include prepare script
ADD https://raw2.github.com/thbe/virtual-docker/master/scripts/puppet.sh /puppet.sh

# Add sl-release to fix yum missing release version error
RUN yum --releasever=6.5 -y install sl-release

# Remove additional repositories
RUN rm -f /etc/yum.repos.d/atrpms.repo
RUN rm -f /etc/yum.repos.d/elrepo.repo
RUN rm -f /etc/yum.repos.d/epel.repo
RUN rm -f /etc/yum.repos.d/rpmforge.repo

# Run prepare script
RUN chmod 755 /puppet.sh
RUN /puppet.sh
