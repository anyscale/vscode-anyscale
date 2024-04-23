#!/bin/bash
set -e

rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

# Install basic dependencies

dnf update -y -q
dnf install -y -q sudo wget zip unzip git python3.9 make gcc gcc-c++ curl git zstd
dnf clean all

# VS Code build dependencies

wget https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Official -P /etc/pki/rpm-gpg/
rpm -vv --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Official
yum -y --repofrompath=centos,http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/ groupinstall "Development Tools" --nobest 
yum -y --repofrompath=centos,http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/ install libX11-devel.x86_64 libsecret-devel krb5-devel --nobest
yum -y --repofrompath=centos,http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/ install libxkbfile --nobest 
yum -y --repofrompath=centos,http://mirror.centos.org/centos/8-stream/PowerTools/x86_64/os/ install libxkbfile-devel --nobest

