#!/bin/bash

export USER=root

cd /opt/contrail
tar -xf repo.tar
#repo init -u https://github.com/Juniper/contrail-vnc -m noauth.xml
repo sync

python /opt/contrail/third_party/fetch_packages.py
