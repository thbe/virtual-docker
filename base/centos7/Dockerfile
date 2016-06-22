### Dockerfile
#
# VERSION:
#   1.0
#
# DESCRIPTION:
#   Create CentOS Linux 7 docker base image with Puppet and EPEL
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/centos7/Dockerfile
#   docker build --rm -t local/centos7 .
#
# USAGE:
#   docker run --rm -ti local/centos7 /bin/bash
#

# Smallest base image, just to launch a container
FROM centos:7
MAINTAINER Thomas Bendler, project@bendler-net.de

# Set container environment
ENV container docker

# Set locale to en_US.utf-8
RUN echo "export LANG=en_US.utf-8" > /tmp/export_LANG.sh
ENV BASH_ENV=/tmp/export_LANG.sh \
ENV=/tmp/export_LANG.sh \
PROMPT_COMMAND="source /tmp/export_LANG.sh"

# Include prepare script
ADD https://raw.githubusercontent.com/thbe/virtual-docker/master/scripts/puppet.sh /puppet.sh

# Run prepare script
RUN chmod 755 /puppet.sh
RUN /puppet.sh

# Prepare systemd
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
