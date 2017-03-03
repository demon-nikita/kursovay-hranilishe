FROM vlavad/systemd-base
MAINTAINER "Nikita-dimon" <nikitos.u@mail.ru>
ENV container docker

RUN yum -y update; \

EXPOSE 80 443

CMD ["/usr/sbin/init"]
