FROM ubuntu:14.04
MAINTAINER John Callanta

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
RUN echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list
RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install mongodb-10gen
RUN apt-get -y install openssh-server supervisor
RUN mkdir -pv /root/.ssh && chmod 700 /root/.ssh
RUN mkdir -pv /var/run/sshd
RUN echo 'your pub key goes here' > /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD /usr/bin/supervisord

EXPOSE 27017 
EXPOSE 22
