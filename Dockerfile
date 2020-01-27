LABEL Maintainer="eninkaduk@gmail.com"
LABEL Description="This image is used to combine worpress, nginx and php-fpm in a single container"

FROM wordpress:php7.2-fpm

RUN apt-get update
RUN apt-get install -y nano nginx curl

# php-fpm is blocked in this exact image, https://github.com/docker-library/docs/pull/1111/commits/aab8b5b1dce19e7d2459a908f1f130d56a14807b
# remove this directive to unlock it
RUN rm /etc/apt/preferences.d/no-debian-php
# install it ;)
RUN apt-get update && apt-get install -y php-fpm
