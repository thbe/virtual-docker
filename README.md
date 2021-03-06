# virtual-docker

Virtual docker is a set of files helping to create docker images for local usage.

## Introduction

This git repository offers docker images for:

* Alpine latest
* CentOS 6
* CentOS 7
* Ubuntu 16.04

All base images except Alpine are equipped with a current version of Puppet.

## Usage

### Build

#### Alpine latest

```bash
wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/alpine/Dockerfile
docker build --rm -t local/alpine .
```

#### CentOS 6

```bash
wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/centos6/Dockerfile
docker build --rm -t local/centos6 .
```

#### CentOS 7

```bash
wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/centos7/Dockerfile
docker build --rm -t local/centos7 .
```

#### Ubuntu 16.04

```bash
wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/ubuntu16.04/Dockerfile
docker build --rm -t local/ubuntu16.04 .
```

### Run

#### Interactive usage

##### Alpine latest

```bash
docker run --rm -ti local/alpine /bin/sh
```

##### CentOS 6

```bash
docker run --rm -ti local/centos6 /bin/bash
```

##### CentOS 7

```bash
docker run --rm -ti local/centos7 /bin/bash
```

##### Ubuntu 16.04

```bash
docker run --rm -ti local/ubuntu16.04 /bin/bash
```


#### Service usage

##### CentOS 7 with NGINX

This is an example to create a docker instance based on CentOS 7 with NGINX running on top.

```bash
wget https://raw.githubusercontent.com/thbe/virtual-docker/master/demo/c7-nginx/Dockerfile
docker build --rm -t local/c7-nginx .
docker run --rm -ti local/c7-nginx -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 nginx
```

## Testing

The images can be used for interactive testing of puppet modules. As an example, to test a module, the following steps are needed:

### Build and run image
```bash
wget https://raw.githubusercontent.com/thbe/virtual-docker/master/base/centos7/Dockerfile
docker build --rm -t local/centos7 .
docker run --rm -ti local/centos7 /bin/bash
```

### Test Puppet module within image

```puppet
puppet module install thbe/ssmtp
puppet apply -e 'include ssmtp'
```
