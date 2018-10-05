FROM local/centos7
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

# Set metadata
LABEL maintainer="Thomas Bendler <project@bendler-net.de>"
LABEL version="1.0"
LABEL description="Create CentOS Linux 7 docker image with NGINX"

# Set environment
ENV container docker
ENV LANG en_US.UTF-8
ENV TERM xterm

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
RUN yum -y install nginx && \
    systemctl enable nginx.service && \
    yum clean all

# Expose standard http port
EXPOSE 80 443

# Start systemd
CMD ["/usr/sbin/init"]
