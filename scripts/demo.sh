#! /bin/sh
#
# Simple docker demo to show possibilities
#

### Prepare base image ###
yum -y install vim-common vim-enhanced curl wget net-tools gpm-libs perl-libs tar

### Prepare repositories ###
rpm -Uvh http://mirror.de.leaseweb.net/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum clean all && yum -y update

### Install webserver ###
yum -y install nginx
service nginx start

### Install puppet ###
yum -y install puppet
puppet module install thbe/ssmtp
puppet apply -e "include ssmtp"

### Show demo results ###
echo
echo "Webserver installed, please check http://$(facter ipaddress)/"
echo "Puppet installed ssmtp and switched the default mta:"
ls -alFh /usr/sbin/sendmail
ls -alFh /etc/alternatives/mta
