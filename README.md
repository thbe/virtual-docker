virtual-docker
==============

#Introduction

Dockerfiles for

* Scientific Linux 6
* CentOS 6
* Fedora 20

to create images with Puppet installed to be used for Puppet
module testing.

#Usage

The usage for each distribution is described inside the docker file

#Testing

The images created by the docker files can be used for testing Puppet modules.
To test a module, the following steps are needed (as an example):
```puppet
puppet module install thbe/ssmtp
puppet apply -e 'include ssmtp'
```
