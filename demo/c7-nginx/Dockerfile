### Dockerfile
#
# VERSION:
#   1.0
#
# DESCRIPTION:
#   Create CentOS Linux 7 docker image with NGINX
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#   You need to build base/centos7 first, see:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/centos7/Dockerfile
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/demo/c7-nginx/Dockerfile
#   docker build --rm -t local/c7-nginx .
#
# USAGE:
#   docker run --privileged -di -p 80:80 -p 443:443 local/c7-nginx
#   docker logs <container-id>
#   docker exec -ti <container-id> /bin/bash
#

# Use local centos7 build from base/centos7
FROM local/centos7
MAINTAINER Thomas Bendler, project@bendler-net.de

# Setup and prepare systemd
RUN yum -y install sysvinit-tools initscripts systemd
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
     rm -f /lib/systemd/system/multi-user.target.wants/*; \
     rm -f /etc/systemd/system/*.wants/*; \
     rm -f /lib/systemd/system/local-fs.target.wants/*; \
     rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
     rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
     rm -f /lib/systemd/system/basic.target.wants/*; \
     rm -f /lib/systemd/system/anaconda.target.wants/*;
# VOLUME [ "/sys/fs/cgroup" ]

# Install NGINX
RUN yum -y install nginx
RUN systemctl enable nginx.service

# Clean up
RUN yum clean all

# Expose standard http port
EXPOSE 80 443

# Start systemd
CMD ["/usr/sbin/init"]
