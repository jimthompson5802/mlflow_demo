#!/bin/sh
# wait-for-postgres.sh
# Simple delay to wait til Postgres database is up

set -e -x

cmd="$@"

sleep 20

echo "Assume Postgres is up - executing command"
exec $cmd