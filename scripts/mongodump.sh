#!/bin/bash
set -e

BACKUPS_DIR=mongodb_backup
BACKUPS_SUB_DIR=$(date +%Y_%m_%d)
BACKUPS_FILE=$(date +%Y_%m_%d_%H_%M_%S).gz

DB="healthcare"
DB_HOST="localhost"
DB_PORT="2717"
DB_USER_NAME="healthcareUser"
DB_USER_PASSWORD="healthcarePassword"

echo "Backing up MongoDB : $DB"

echo "Creating backup directory"
mkdir -p $HOME/$BACKUPS_DIR/$BACKUPS_SUB_DIR/

mongodump --db $DB --host $DB_HOST --port $DB_PORT --username $DB_USER_NAME --password $DB_USER_PASSWORD --gzip --archive=$HOME/$BACKUPS_DIR/$BACKUPS_SUB_DIR/$BACKUPS_FILE


echo "Backup completed."