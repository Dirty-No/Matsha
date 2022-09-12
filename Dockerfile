FROM nginx:latest

RUN apt update && apt install -yqq fcgiwrap

CMD /etc/init.d/fcgiwrap start && chmod 777 /run/fcgiwrap.socket  && bash docker-entrypoint.sh nginx -g "daemon off;"