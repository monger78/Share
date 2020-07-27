#!/bin/bash
mkdir -p /root/localrepo
mkdir -p /root/repobackup
cp -r /etc/yum.repos.d/* /root/repobackup
rm -rf /etc/yum.repos.d/*
cp -r /run/media/root/mocupdate/* /root/localrepo
sed -i 's/gpgcheck=1/gpgcheck=0/' /etc/yum.conf
cat > /etc/yum.repos.d/local.repo << EOF
[local]
name=local
baseurl=file:/root/localrepo
enabled=1
EOF
read -n 1 -r -s -p $'Press Enter To Update...\n'
yum update --skip-broken