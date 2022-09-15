#!/usr/bin/env bash

query() {
    source ../config/db.sh
    export PGPASSWORD="$POSTGRES_PASSWORD"

    QUERY="$1"

    psql --csv --host="$POSTGRES_HOST" \
        --username="$POSTGRES_USER" \
        --dbname="$POSTGRES_DB" -w -c "$QUERY"
}

queryJSON() {
    query "$1" | csvjson | jq -r "$2"
}
