#!/usr/bin/env bash

source ../lib/sql.sh

UserService.findAll() {
    queryJSON 'SELECT * from users'
}

UserService.findAllPublic() {
    queryJSON 'SELECT id, username, email, created_on from users'
}
