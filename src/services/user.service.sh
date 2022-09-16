#!/usr/bin/env bash

source ../utils/sql.utils.sh

UserService.findAll() {
    sql.queryJSON 'SELECT * from users'
}

UserService.findAllPublic() {
    sql.queryJSON 'SELECT id, username, email, created_on from users'
}

UserService.findOne() {
    # Filter digit characters.
    ID=$(<<<"$1" tr -dc '0-9')
    sql.queryJSON 'SELECT * from users where id = '"$ID"
}

UserService.findOnePublic() {
    # Filter digit characters.
    ID=$(<<<"$1" tr -dc '0-9')
    sql.queryJSON 'SELECT id, username, email, created_on from users where id = '"$ID"
}

UserService.create() {
    sql.queryJSON ''
}
