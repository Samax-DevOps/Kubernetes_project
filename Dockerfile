FROM centos
MAINTAINER vikash@gmail.com

RUN cd /etc/yum.repos.d/ && \
    sed -i 's/mirrorlist/#mirrorlist/g' CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' CentOS-*

RUN yum -y install java httpd zip unzip curl

WORKDIR /var/www/html/
RUN curl -O https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip -q photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
