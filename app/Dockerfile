FROM centos:centos7

#Install required Packages
RUN yum install apr-util-devel gcc pcre-devel libxml2-devel wget curl gcc-devel curl-devel httpd-devel make -y 

WORKDIR /root

#Installing httpd service 
RUN wget --no-check-certificate https://mirrors.sonic.net/apache//httpd/httpd-2.4.46.tar.gz &&\
              tar -xvxf httpd-2.4.46.tar.gz &&\
              rm -rf httpd-2.4.46.tar.gz &&\
              cd httpd-2.4.46 &&\
              ./configure && make clean && make && make install

#Installing php7
RUN wget --no-check-certificate https://www.php.net/distributions/php-7.3.7.tar.gz &&\
    tar -xvzf php-7.3.7.tar.gz &&\
    rm -rf php-7.3.7.tar.gz &&\
    cd php-7.3.7 && ./configure --with-apxs2=/usr/local/apache2/bin/apxs --enable-mbstring --enable-mysqlnd --with-mysqli && make clean && make && make install 

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

#Installing WIKIMEDIA
RUN wget --no-check-certificate https://releases.wikimedia.org/mediawiki/1.33/mediawiki-1.33.0.tar.gz &&\
    tar -xvzf mediawiki-1.33.0.tar.gz &&\
    rm -rf mediawiki-1.33.0.tar.gz &&\
    mv mediawiki-1.33.0 /usr/local/apache2/htdocs/ &&\
    mv /usr/local/apache2/htdocs/mediawiki-1.33.0 /usr/local/apache2/htdocs/wiki

CMD /usr/local/apache2/bin/apachectl -DFOREGROUND
EXPOSE 80