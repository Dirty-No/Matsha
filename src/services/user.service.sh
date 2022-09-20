#!/usr/bin/env bash

source ../utils/sql.utils.sh

UserService.findAll() {
    sql.query 'SELECT jsonb_agg(users) from users'
}

UserService.findAllPublic() {
    sql.query 'SELECT jsonb_agg(user_pub) from (SELECT id, username, email, created_on from users) as user_pub'
}

UserService.findOne() {
    # Filter digit characters.
    ID=$(<<<"$1" tr -dc '0-9')
    sql.query 'SELECT jsonb_agg(*) from users where id = '"$ID"
}

UserService.findOnePublic() {
    # Filter digit characters.
    ID=$(<<<"$1" tr -dc '0-9')
    sql.query 'SELECT jsonb_agg(user_pub) from (SELECT id, username, email, created_on from users where id = '"$ID) as user_pub"
}

UserService.create() {
    
    # sql.query "INSERT INTO users (username, password, email, created_on) VALUES ('test$i', 'passtest$i', 'test$i@gmail.com', '$(date)')"
}
