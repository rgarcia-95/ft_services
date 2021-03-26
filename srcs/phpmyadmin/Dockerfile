# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgarcia- <rgarcia-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/11 20:05:32 by rgarcia-          #+#    #+#              #
#    Updated: 2021/03/17 15:14:58 by rgarcia-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk add --no-cache phpmyadmin nginx php7 php7-mysqli php7-json php7-mbstring php7-fpm php7-opcache && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN		adduser -D -g 'www' www && mkdir -p /run/nginx www && \
		chown -R www:www /var/lib/nginx && \
		chown -R www:www /www

RUN		mv /usr/share/webapps/phpmyadmin /www/

RUN		mkdir -p /etc/phpmyadmin/tmp && \
		chmod 777 /etc/phpmyadmin/tmp

COPY	/src/telegraf.conf /etc/telegraf/

COPY	/src/nginx.conf /etc/nginx/nginx.conf

COPY	/src/config.inc.php /etc/phpmyadmin/config.inc.php

COPY	/src/execute.sh ./

EXPOSE	5000

ENTRYPOINT	sh execute.sh