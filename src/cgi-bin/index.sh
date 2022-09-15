#!/usr/bin/env bash

echo "Content-type: text/html"
echo ""

USER_PICTURE="/static/img/smaccary.jpg" envsubst < ../../templates/index.html
