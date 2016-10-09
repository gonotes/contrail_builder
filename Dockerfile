FROM ubuntu:14.04.2
MAINTAINER Nachi Ueno <nati.ueno@gmail.com>

ENTRYPOINT ["/bin/bash"]

ENV USER=root

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y iproute2 tmux netcat curl git vim python software-properties-common wget

RUN DEBIAN_FRONTEND=noninteractive apt-add-repository ppa:opencontrail/ppa
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf automake bison debhelper flex libcurl4-openssl-dev libexpat-dev libgettextpo0 libprotobuf-dev libtool libxml2-utils make protobuf-compiler python-all python-dev python-lxml python-setuptools python-sphinx ruby-ronn scons unzip vim-common libsnmp-python libipfix-dev librdkafka-dev librdkafka1 libboost-dev libboost-chrono-dev libboost-date-time-dev libboost-filesystem-dev libboost-program-options-dev libboost-python-dev libboost-regex-dev libboost-system-dev libcurl4-openssl-dev google-mock libgoogle-perftools-dev liblog4cplus-dev libtbb-dev libhttp-parser-dev libxml2-dev libicu-dev linux-headers-4.2.0-27-generic

RUN wget http://downloads.datastax.com/cpp-driver/ubuntu/14.04/cassandra/v2.2.0/cassandra-cpp-driver-dev_2.2.0-1_amd64.deb
RUN wget http://downloads.datastax.com/cpp-driver/ubuntu/14.04/cassandra/v2.2.0/cassandra-cpp-driver_2.2.0-1_amd64.deb
RUN wget http://downloads.datastax.com/cpp-driver/ubuntu/14.04/dependencies/libuv/v1.7.5/libuv_1.7.5-1_amd64.deb

RUN dpkg -i *.deb

RUN mkdir -p /opt/contrail
ADD repo.tar /opt/contrail/repo.tar

#RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo
ADD repo /bin/repo
RUN chmod a+x /bin/repo

ADD setup.sh /setup.sh
RUN chmod +x /setup.sh
ADD build.sh /build.sh
RUN chmod +x /build.sh

RUN /setup.sh

RUN USER=ROOT python /opt/contrail/third_party/fetch_packages.py

RUN apt-get install -y libzookeeper-mt-dev

RUN /build.sh
