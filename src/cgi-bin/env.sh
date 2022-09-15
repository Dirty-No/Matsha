#!/usr/bin/env bash

echo "Content-type: text/html"
echo ""

ID=$(id) ENV=$(env) BODY=$(cat) HOSTNAME=$(hostname) envsubst < ../../templates/env.html
