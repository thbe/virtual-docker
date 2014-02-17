#! /bin/sh
#
# Prepare docker instance to be Puppet ready
#
# Author: Thomas Bendler <project@bendler-net.de>
# Date:   Mon Feb 17 14:56:48 CET 2014
#

### Get current operating system ###
if $(grep Fedora /etc/redhat-release); then
  DIST=fedora
  MAJORVER=$(grep Fedora /etc/redhat-release | cut -d ' ' -f3)
else
  DIST=rhel
  MAJORVER=$(cat /etc/redhat-release | sed -e 's/.*release\ //' -e 's/\ .*//' | cut -d '.' -f1)
fi

### Install basic toolset ###
yum -y install vim-common vim-enhanced curl wget net-tools gpm-libs perl-libs tar

### Prepare and install additional repositories ###
if [ "x${DIST}" = "xfedora" ]; then
  if [ "x${MAJORVER}" = "x20" ]; then
    rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-fedora-20.noarch.rpm
  fi
fi
if [ "x${DIST}" = "xrhel" ]; then
  if [ "x${MAJORVER}" = "x6" ]; then
    rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
  fi
  if [ "x${MAJORVER}" = "x7" ]; then
    rpm -Uvh http://dl.fedoraproject.org/pub/epel/beta/7/x86_64/epel-release-7-0.1.noarch.rpm
    rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
  fi
fi
yum clean all && yum -y update

### Install puppet ###
yum -y install puppet

### Show result ###
echo
echo "Docker container prepared for Puppet operations ..."
