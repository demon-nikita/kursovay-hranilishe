FROM vlavad/systemd-base
MAINTAINER "VlaVad" <vlavad@gmail.com>
ENV container docker

RUN yum -y update; \
yum -y install httpd mod_ssl php; \
yum -y install php-symfony-dom-crawler php-gd php-pdo; \
cd  /root/GIT; \
git pull; \
rm -rf /etc/httpd/conf; \
ln -s /root/GIT/ETC/httpd/conf /etc/httpd/conf; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*; \
rm -f /etc/systemd/system/*.wants/*; \
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*; \
rm -f /lib/systemd/system/anaconda.target.wants/*; \
systemctl enable httpd.service; \
rm -f /anaconda-post.log /var/log/yum.log

VOLUME [ "/sys/fs/cgroup" ]
VOLUME [ "/etc/pki" ]
VOLUME [ "/etc/httpd/conf.d" ]
VOLUME [ "/home" ]
VOLUME [ "/var/log" ]
VOLUME [ "/var/www" ]
VOLUME [ "/var/lib/nextcloud" ]

EXPOSE 80 443

CMD ["/usr/sbin/init"]
