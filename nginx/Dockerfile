# Install a more up to date mongodb than what is included in the default ubuntu repositories.

FROM ubuntu:14.04
MAINTAINER John Callanta

RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install nginx openssh-server supervisor
RUN mkdir -pv /root/.ssh && chmod 700 /root/.ssh
RUN mkdir -pv /var/run/sshd
RUN echo 'put your pub key here' > /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
RUN mkdir -pv /var/www/html
RUN echo "hello world!" > /var/www/html/index.html

ADD nginx.conf /etc/nginx.conf
ADD default /etc/nginx/sites-available/default
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /etc/nginx

CMD /usr/bin/supervisord

EXPOSE 80 
EXPOSE 22
