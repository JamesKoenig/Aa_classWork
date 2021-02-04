#!/usr/bin/env sh

dropdb -U postgres sqlzoo
createdb -U postgres sqlzoo
psql -U postgres sqlzoo < data/create_tables.sql
