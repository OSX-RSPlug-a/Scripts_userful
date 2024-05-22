#!/bin/bash

# MySQL Credentials
MYSQL_USER="root"
MYSQL_PASSWORD="root"
NEW_DATABASE_NAME="data_people"
BACKUP_DIR="/home/ubuntu/mysql_backup"

# Find the latest backup file
LATEST_BACKUP=$(ls -t "$BACKUP_DIR" | head -1)

# Check if a backup file exists
if [ -z "$LATEST_BACKUP" ]; then
  echo "No backup files found in $BACKUP_DIR"
  exit 1
fi

# Create the new database
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE $NEW_DATABASE_NAME;"

# Check if the database was created successfully
if [ $? -ne 0 ]; then
  echo "Failed to create the new database: $NEW_DATABASE_NAME"
  exit 1
fi

# Restore the backup to the new database
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$NEW_DATABASE_NAME" < "$BACKUP_DIR/$LATEST_BACKUP"

# Check if the restoration was successful
if [ $? -eq 0 ]; then
  echo "Database restoration successful."
else
  echo "Database restoration failed."
fi