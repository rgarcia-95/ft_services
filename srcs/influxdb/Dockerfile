# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgarcia- <rgarcia-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/17 14:16:44 by rgarcia-          #+#    #+#              #
#    Updated: 2021/03/17 14:20:12 by rgarcia-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update && apk add openrc --no-cache && \
		apk add influxdb && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		openrc && touch /run/openrc/softlevel && \
		rc-update add telegraf

COPY	/src/execute.sh /

COPY	/src/telegraf.conf /etc/

EXPOSE	8086

ENTRYPOINT	sh execute.sh