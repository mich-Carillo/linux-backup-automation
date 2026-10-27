#!/bin/bash

#CONFIG
CONFIG_FILE="./config.env"
if [ -f "$CONFIG_FILE" ]; then
  source "$CONFIG_FILE"
else
  echo "Configuration file not found, using default values."
  SOURCE_DIR="/home/mich/my_projects"
  BACKUP_DIR="/home/mich/projects_backup"
  RETENTION_DAYS=7
fi

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")
ARCHIVE_NAME="backup_$TIMESTAMP.tar.gz"
FINAL_PATH="$BACKUP_DIR/$ARCHIVE_NAME"

#CHECKING IF BACKUP_DIR EXISTS
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
  echo "Directory $BACKUP_DIR successfully created"
fi

echo "Starting $SOURCE_DIR backup..."

#CREATING COMPRESSED ARCHIVE tar.gz
tar -czf "$FINAL_PATH" "$SOURCE_DIR"

#CHECKING IF LAST OPERATION SUCCESSFULLY COMPLETED
if [ $? -eq 0 ]; then
  echo "Archive successfully created!"
else
  echo "ERROR! Archive creation gone wrong!"
  exit 1
fi

#AUTOMATIC DELETE
find "$BACKUP_DIR" -name "backup_*.tar.gz" -type f -mtime +"$RETENTION_DAYS" -delete
