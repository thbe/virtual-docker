#! /bin/sh
#
# Simple docker demo to show possibilities
#
# Start docker container with:
# docker run --rm -ti -p 80:80 local/centos6 /bin/bash
#
# Start demo with:
# wget https://raw.githubusercontent.com/thbe/virtual-docker/master/scripts/demo.sh
# chmod 755 /demo.sh
# /demo.sh
#

### Get current operating system major version ###
MAJORVER=$(cat /etc/redhat-release | sed -e 's/.*release\ //' -e 's/\ .*//' | cut -d '.' -f1)

### Install webserver ###
yum -y install nginx
if [ "x${MAJORVER}" = "x6" ]; then
  service nginx start
fi
if [ "x${MAJORVER}" = "x7" ]; then
  systemctl start nginx.service
fi


### Install puppet ###
yum -y install puppet
puppet module install thbe-ssmtp
puppet apply -e 'class { "ssmtp": }'

### Show demo results ###
echo
echo "Webserver installed, please check http://localhost/"
echo "Puppet installed ssmtp and switched the default mta:"
ls -alFh /usr/sbin/sendmail
ls -alFh /etc/alternatives/mta
