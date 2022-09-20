#!/usr/bin/env bash

sql.query() {
    source ../config/db.config.sh
    export PGPASSWORD="$POSTGRES_PASSWORD"

    QUERY="$1"

    echo SQL QUERY: "$QUERY" >&2

    psql -t --host="$POSTGRES_HOST" \
        --username="$POSTGRES_USER" \
        --dbname="$POSTGRES_DB" -w -c "$QUERY"
}

sql.queryJSON() {
    sql.query "$1" | csvjson | jq -r "$2"
}

