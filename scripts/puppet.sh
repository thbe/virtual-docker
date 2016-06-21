#! /bin/sh
#
# Prepare docker instance to be Puppet ready
#
# Author: Thomas Bendler <project@bendler-net.de>
# Date:   Mon Feb 17 14:56:48 CET 2014
#

### Get current operating system ###
DISTSWITCH=$(grep Fedora /etc/redhat-release | wc -l)
if [ "x$DISTSWITCH" = "x1"  ]; then
  DIST=fedora
  MAJORVER=$(grep Fedora /etc/redhat-release | cut -d ' ' -f3)
else
  DIST=rhel
  MAJORVER=$(cat /etc/redhat-release | sed -e 's/.*release\ //' -e 's/\ .*//' | cut -d '.' -f1)
fi

### Install basic toolset ###
yum -y install vim-common vim-enhanced curl wget net-tools gpm-libs perl-libs tar

### Prepare and install additional repositories ###
if [ "x${DIST}" = "xrhel" ]; then
  if [ "x${MAJORVER}" = "x6" ]; then
    rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
    rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
  fi
  if [ "x${MAJORVER}" = "x7" ]; then
    rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
  fi
fi

### Upgrade local image ###
yum clean all && yum -y update

### Install puppet ###
yum -y install puppet-agent

### Show result ###
echo "Installation of Puppet and common tools finished!"
echo "Docker container ready for action ..."
