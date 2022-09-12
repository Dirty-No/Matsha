FROM nginx:latest

RUN apt update && apt install -yqq fcgiwrap jq curl file xxd uuid

CMD /etc/init.d/fcgiwrap start && chmod -R 777 /run/fcgiwrap.socket /cgi-bin /templates /uploads && bash docker-entrypoint.sh  nginx -g "daemon off;"
