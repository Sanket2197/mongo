#!/bin/bash
set -e

BACKUPS_DIR=mongodb_backup
BACKUPS_SUB_DIR=$(date +%Y_%m_%d)
BACKUP_FILE_PATH=""

DB="healthcare"
DB_HOST="localhost"
DB_PORT="2717"
DB_USER_NAME="mongoAdmin"
DB_USER_PASSWORD="mongoAdmin"

for entry in "$HOME/$BACKUPS_DIR/$BACKUPS_SUB_DIR"/*
do
  BACKUP_FILE_PATH="$entry"
done

echo "Restoring MongoDB : $DB"

mongorestore --host $DB_HOST --port $DB_PORT --username $DB_USER_NAME --password $DB_USER_PASSWORD  --gzip --archive="$BACKUP_FILE_PATH" 

echo "Restore completed."