#!/bin/bash

export USER=root

DEBIAN_FRONTEND=noninteractive apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y iproute2 tmux netcat curl git vim python software-properties-common wget

DEBIAN_FRONTEND=noninteractive apt-add-repository ppa:opencontrail/ppa
DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf automake bison debhelper flex libcurl4-openssl-dev libexpat-dev libgettextpo0 libprotobuf-dev libtool libxml2-utils make protobuf-compiler python-all python-dev python-lxml python-setuptools python-sphinx ruby-ronn scons unzip vim-common libsnmp-python libipfix-dev librdkafka-dev librdkafka1 libboost-dev libboost-chrono-dev libboost-date-time-dev libboost-filesystem-dev libboost-program-options-dev libboost-python-dev libboost-regex-dev libboost-system-dev libcurl4-openssl-dev google-mock libgoogle-perftools-dev liblog4cplus-dev libtbb-dev libhttp-parser-dev libxml2-dev libicu-dev libzookeeper-mt-dev

wget http://downloads.datastax.com/cpp-driver/ubuntu/14.04/cassandra/v2.2.0/cassandra-cpp-driver-dev_2.2.0-1_amd64.deb
wget http://downloads.datastax.com/cpp-driver/ubuntu/14.04/cassandra/v2.2.0/cassandra-cpp-driver_2.2.0-1_amd64.deb
wget http://downloads.datastax.com/cpp-driver/ubuntu/14.04/dependencies/libuv/v1.7.5/libuv_1.7.5-1_amd64.deb

dpkg -i *.deb
