#!/bin/bash

# Create the pgbackrest.conf file dynamically from environment variables
cat <<EOF > /etc/pgbackrest/pgbackrest.conf
[global]
repo1-retention-full=7
repo1-path=/var/lib/pgbackrest
repo1-type=s3
repo1-s3-endpoint=${PGBACKREST_S3_ENDPOINT}
repo1-s3-bucket=${PGBACKREST_S3_BUCKET}
repo1-s3-region=${PGBACKREST_S3_REGION}
repo1-s3-key=${PGBACKREST_S3_KEY}
repo1-s3-key-secret=${PGBACKREST_S3_SECRET}
log-path=/var/log/pgbackrest
log-level-console=info
log-level-file=info
start-fast=y
delta=y
compress-type=zst
compress-level=6

[mydb]
pg1-path=/var/lib/postgresql/data
EOF

# Run the provided command (default to pgBackRest)
exec "$@"
