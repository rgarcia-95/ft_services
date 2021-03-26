# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgarcia- <rgarcia-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/11 19:11:43 by rgarcia-          #+#    #+#              #
#    Updated: 2021/03/17 12:48:06 by rgarcia-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk -U upgrade && apk add mysql mariadb-client openrc && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		mkdir -p /run/mysqld && \
		chown -R root:root /run/mysqld

COPY	/src/my.cnf /etc/

COPY	/src/wordpress.sql /

COPY	/src/execute.sh /

COPY	/src/telegraf.conf /etc/telegraf/

COPY	/src/init_file /

RUN		chmod 777 execute.sh

EXPOSE	3306

ENTRYPOINT	sh execute.sh