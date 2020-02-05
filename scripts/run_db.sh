#!/usr/bin/env bash

docker run -d --name db -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres postgres:11-alpine

docker exec -it db psql -U postgres -d postgres -f sql/create_table.sql


