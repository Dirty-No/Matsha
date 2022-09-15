#!/usr/bin/env bash

# Import SQL query function
source ../lib/sql.sh
source ../config/db.sh

# Reset database when flag is set (don't set in production)
if [ "$RESET_DB" = "true" ];then
    query "DROP TABLE users;"
fi

# Init user table
query 'CREATE TABLE IF NOT EXISTS users (
        id serial PRIMARY KEY,
        username VARCHAR ( 50 ) UNIQUE NOT NULL,
        password VARCHAR ( 50 ) NOT NULL,
        email VARCHAR ( 255 ) UNIQUE NOT NULL,
        created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP 
);'

# Create test users
for i in {0..10};do
    query "INSERT INTO users (username, password, email, created_on) VALUES ('test$i', 'passtest$i', 'test$i@gmail.com', '$(date)')"
done
