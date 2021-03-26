# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgarcia- <rgarcia-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/17 13:34:40 by rgarcia-          #+#    #+#              #
#    Updated: 2021/03/17 13:46:36 by rgarcia-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY	/src/grafana.db /usr/share/grafana/data/

COPY	/src/execute.sh /

COPY	/src/telegraf.conf /etc/telegraf/

WORKDIR	/usr/share/grafana

EXPOSE	3000

ENTRYPOINT	sh /execute.sh