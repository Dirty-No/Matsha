#!/usr/bin/env bash

source ../services/user.service.sh
source ../utils/http.utils.sh

USER_ID="$(http.getParam id)"

if [ -z "$USER_ID" ]; then
    CONTENT=$(UserService.findAllPublic)
else
    CONTENT=$(UserService.findOnePublic "$USER_ID")
fi

if [ "$?" != 0 ] || [ -z "$CONTENT" ]; then
    echo "Status: 400"
    CONTENT='{status: 400, error: "invalid id"}'
fi

echo "Content-type: application/json"
echo
echo "$CONTENT"
