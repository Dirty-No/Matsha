#!/usr/bin/env bash

echo "Content-type: application/json"
echo ""

source ../services/user.sh

UserService.findAllPublic
