#!/bin/sh
# wait-for-postgres.sh
# Loop until Postgres db is available

set -e -x

cmd="$@"

# loop until the connection to Postgres is available
until python /test_pgdb_connection.py; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd
