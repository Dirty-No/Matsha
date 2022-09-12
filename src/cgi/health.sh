#!/usr/bin/env bash

echo "Content-type: application/json"
echo ""

jq <<<'{}' --arg SHELL_ENV "$SHELL_ENV" --argjson PORT ${PORT:-80} --arg STATUS live -r '{ env: $SHELL_ENV, status: $STATUS, port: $PORT }'
