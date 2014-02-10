### Dockerfile
#
# VERSION:
#   0.1
#
# DESCRIPTION:
#   Create CentOS Linux 6.5 with Puppet and EPEL for tests
#
# AUTHOR:
#   Thomas Bendler <project@bendler-net.de>
#
# COMMENTS:
#   This image is used as base for all data containers.
#
# USAGE:
#   # Download data Dockerfile
#   wget https://raw2.github.com/thbe/osdc-bootstrap/master/docker/centos/Dockerfile
#
#   # Build data image
#   docker build -rm .
#
#   # Create a data container
#   docker run -name centos6-puppet-test thbe/centos-puppet -rm -t -i /bin/bash
#
#MAINTAINER Thomas Bendler <project@bendler-net.de>

# Smallest base image, just to launch a container
FROM thbe/centos:6.5

# Create a regular user
RUN echo 'sysadm:x:1000:1000::/home/sysadm:/bin/sh' >> /etc/passwd
RUN echo 'sysadm:x:1000:' >> /etc/group

# Create directory for that user
RUN mkdir -p /home/sysadm
RUN chown sysadm:sysadm /home/sysadm

# Add base packages
RUN yum -y install vim-common vim-enhanced curl wget net-tools gpm-libs perl-libs

# Add EPEL and Puppetlabs repository
RUN rpm -Uvh http://mirror.de.leaseweb.net/epel/6/i386/epel-release-6-8.noarch.rpm
RUN rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm

# Update container
RUN yum clean all
RUN yum -y update

# Install Puppet agent
RUN yum -y install puppet tar
