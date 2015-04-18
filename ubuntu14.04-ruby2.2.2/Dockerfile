FROM ubuntu:14.04.2
MAINTAINER John Callanta

ENV RUBY_VERSION 2.2.2
ENV RUBY_SRC_URL ftp://ftp.ruby-lang.org/pub/ruby/2.2
ENV INSTALL_PREFIX /usr/local
ENV BUILD_DIR /usr/local/src/ruby

RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install wget htop tmux sysstat ifstat vim screen nmon ncdu logtail unattended-upgrades software-properties-common python-software-properties python-pip python-dev build-essential libreadline-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison libcurl4-openssl-dev ssl-cert libsqlite3-dev libffi-dev libgdbm-dev gawk supervisor openssh-server sqlite3
RUN add-apt-repository -y ppa:git-core && apt-get -y update && apt-get -y install git
RUN pip install awscli
RUN mkdir -pv ${BUILD_DIR}
RUN cd ${BUILD_DIR}
RUN echo "Downloading Ruby source to ${BUILD_DIR}"
RUN wget ${RUBY_SRC_URL}/ruby-${RUBY_VERSION}.tar.gz
RUN tar -xvzf ruby-${RUBY_VERSION}.tar.gz -C ${BUILD_DIR}/
RUN cd ${BUILD_DIR}/ruby-${RUBY_VERSION}
RUN ${BUILD_DIR}/ruby-${RUBY_VERSION}/configure --prefix=${INSTALL_PREFIX} --with-readline-dir=/usr/lib/x86_64-linux-gnu/libreadline.so
RUN make
RUN make install
RUN rm -rfv ${BUILD_DIR}
RUN mkdir -pv /root/.ssh && chmod 700 /root/.ssh
RUN mkdir -pv /var/run/sshd

ADD configs/authorized_keys /root/.ssh/authorized_keys

RUN chmod 600 /root/.ssh/authorized_keys
RUN rm -rfv ${BUILD_DIR}
RUN gem install bundler
