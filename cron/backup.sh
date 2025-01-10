#!/bin/bash
# Run pgBackRest backup
pgbackrest --stanza=mydb --type=full backup
