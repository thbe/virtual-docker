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
#   You need to build base/centos7 first
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/demo/c7-nginx/Dockerfile
#   docker build --rm -t local/c7-nginx .
#
# USAGE:
#   docker run --rm -ti local/c7-nginx -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 nginx
#

# Use local centos7 build from base/centos7
FROM local/centos7
MAINTAINER Thomas Bendler, project@bendler-net.de

# Install NGINX
RUN yum -y install nginx
RUN yum clean all
RUN systemctl enable nginx.service

# Expose standard http port
EXPOSE 80

# Start systemd
CMD [“/usr/sbin/init”]
