### Dockerfile
#
# VERSION:
#   0.1
#
# DESCRIPTION:
#   Create CentOS 7 Linux with systemd and EPEL enabled
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#
# USAGE:
#   wget https://raw2.github.com/thbe/virtual-docker/master/centos7/Dockerfile
#   docker build --rm -t local/c7-thbe .
#   docker run -t -i local/c7-thbe /bin/bash
#

# Smallest base image, just to launch a container
FROM centos:7
MAINTAINER Thomas Bendler, project@bendler-net.de

# Set container environment
ENV container=docker

# Set locale to en_US.utf-8
RUN echo "export LANG=en_US.utf-8" > /tmp/export_LANG.sh
ENV BASH_ENV=/tmp/export_LANG.sh \
    ENV=/tmp/export_LANG.sh \
    PROMPT_COMMAND="source /tmp/export_LANG.sh"

# Add EPEL
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Setup systemd base image
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
