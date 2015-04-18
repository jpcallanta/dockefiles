FROM ubuntu14.04-ruby2.2.2
MAINTAINER John Callanta

ENV PATH='/usr/bin:/bin/:/usr/local/bin:/usr/sbin:/usr/local/sbin:/sbin'

RUN apt-get -y update
RUN apt-get -y install supervisor htop nmon nmap 

ADD configs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY configs/.vim /root/.vim
ADD configs/.vimrc /root/

CMD /usr/bin/supervisord
