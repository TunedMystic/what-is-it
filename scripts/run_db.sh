#!/usr/bin/env bash

docker run -d --name db -p 5432:5432 -v $(pwd)/sql:/sql -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres postgres:11-alpine

docker exec -it db psql -U postgres -d postgres -f /sql/0001_base.sql

# docker exec -it db find /sql/ -name '*.sql' | sort -u | psql -U postgres -d postgres -f {} \
