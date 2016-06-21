#! /bin/sh
#
# Simple docker demo to show possibilities
#
# Start docker container with:
# docker run --rm -ti -p 80:80 local/centos7 /bin/bash
#

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
