FROM nginx:latest

RUN apt update && apt install -yqq fcgiwrap jq curl 

CMD /etc/init.d/fcgiwrap start && chmod -R 777 /run/fcgiwrap.socket /cgi-bin /templates && bash docker-entrypoint.sh nginx -g "daemon off;"
