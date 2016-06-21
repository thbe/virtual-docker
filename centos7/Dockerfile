### Dockerfile
#
# VERSION:
#   0.1
#
# DESCRIPTION:
#   Create CentOS Linux 7 with Puppet and EPEL for tests
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#
# USAGE:
#   wget https://raw2.github.com/thbe/virtual-docker/master/centos7/Dockerfile
#   docker build -t="local/centos7" .
#   docker run -t -i local/centos7 /bin/bash
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
ADD https://raw2.github.com/thbe/virtual-docker/master/scripts/puppet.sh /puppet.sh

# Run prepare script
RUN chmod 755 /puppet.sh
RUN /puppet.sh

# Setup systemd base image
#RUN yum -y install systemd; yum clean all; \
#(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
#rm -f /lib/systemd/system/multi-user.target.wants/*;\
#rm -f /etc/systemd/system/*.wants/*;\
#rm -f /lib/systemd/system/local-fs.target.wants/*; \
#rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
#rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
#rm -f /lib/systemd/system/basic.target.wants/*;\
#rm -f /lib/systemd/system/anaconda.target.wants/*;
#VOLUME [ "/sys/fs/cgroup" ]
#CMD ["/usr/sbin/init"]
