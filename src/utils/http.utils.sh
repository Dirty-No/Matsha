#!/usr/bin/env bash

# https://stackoverflow.com/questions/3919755/how-to-parse-query-string-from-a-bash-cgi-script
http.getParam() {
    declare -A param
    while IFS='=' read -r -d '&' key value && [[ -n "$key" ]]; do
        if [ "$key" = "$1" ];then
            echo "$value"
            return 0
        fi
    done <<<"${QUERY_STRING}&"
    return 1
}
