# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgarcia- <rgarcia-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/17 12:56:53 by rgarcia-          #+#    #+#              #
#    Updated: 2021/03/17 13:16:21 by rgarcia-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update && \
		apk add openssl && \
		apk add vsftpd && \
		rm -rf /var/cache/apk/* && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# FTPS Config
RUN		echo -e "user\nuser" | adduser user -h /ftps_user;

RUN		chown user:user /ftps_user

RUN		touch /var/log/vsftpd.log

RUN		echo "user" >> /etc/vsftpd/vsftpd.userlist

# SSL
RUN		openssl req -x509 -out /etc/ssl/certs/vsftpd.crt -keyout /etc/ssl/private/vsftpd.key -newkey rsa:2048 -nodes -sha256 -subj '/CN=localhost'

COPY	/src/telegraf.conf /etc/telegraf/

COPY	/src/execute.sh /

EXPOSE	21 31000

ENTRYPOINT	sh execute.sh