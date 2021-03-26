# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgarcia- <rgarcia-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/11 18:33:59 by rgarcia-          #+#    #+#              #
#    Updated: 2021/03/11 18:43:00 by rgarcia-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12.1

RUN		apk --no-cache add php7 php7-mysqli php7-json php7-mbstring php7-fpm php7-opcache nginx && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN		adduser -D -g 'www' www && mkdir -p /run/nginx www && \
		chown -R www:www /var/lib/nginx && chown -R www:www /www

RUN		wget http://wordpress.org/latest.tar.gz && \
		tar -xzvf latest.tar.gz && \
		rm latest.tar.gz && \
		mv /wordpress /www/

COPY	/src/nginx.conf /etc/nginx/nginx.conf

COPY	/src/wp-config.php /www/

COPY	/src/telegraf.conf /etc/telegraf/

COPY	/src/execute.sh ./

EXPOSE	5050

ENTRYPOINT	sh execute.sh