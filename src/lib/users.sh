#!/usr/bin/env bash

source ../lib/sql.sh

findAll() {
    queryJSON 'SELECT * from users'
}
