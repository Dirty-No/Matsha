FROM nginx:latest

WORKDIR /app

COPY . .

RUN apt update && apt install -yqq fcgiwrap jq curl file xxd uuid

CMD bash entrypoint.sh
