FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    apache2 \
    nano \
    g++ \
    libapache2-mod-wsgi-py3 \
    && rm -rf /var/lib/apt/lists/* 

COPY ./hello.cpp /var/www/html/hello.cpp
COPY ./app.wsgi /var/www/html/app.wsgi
COPY ./my-apache-config.conf /etc/apache2/sites-available/000-default.conf

RUN g++ -o /var/www/html/hello.so -shared -fPIC /var/www/html/hello.cpp

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
