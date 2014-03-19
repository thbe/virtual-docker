### Dockerfile
#
# VERSION:
#   0.9
#
# DESCRIPTION:
#   Create Fedora 20 with Puppet for testing
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#
# USAGE:
#   wget https://raw2.github.com/thbe/virtual-docker/master/fedora/Dockerfile
#   docker build -t="thbe/fedora20p" .
#   docker run -t -i thbe/fedora20p /bin/bash
#

# Smallest base image, just to launch a container
FROM mattdm/fedora:f20

# Include prepare script
ADD https://raw2.github.com/thbe/virtual-docker/master/scripts/puppet.sh /puppet.sh

# Run prepare script
RUN chmod 755 /puppet.sh
RUN /puppet.sh
