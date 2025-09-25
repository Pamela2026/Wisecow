#!/bin/bash
# Usage: ./backup.sh /path/to/source /path/to/backup

SOURCE_DIR=$1
BACKUP_DIR=$2
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="backup_report.log"

if [ -z "$SOURCE_DIR" ] || [ -z "$BACKUP_DIR" ]; then
  echo "Usage: $0 <source_directory> <backup_directory>"
  exit 1
fi

BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR" 2>>"$LOG_FILE"

if [ $? -eq 0 ]; then
  echo "Backup successful: $BACKUP_DIR/$BACKUP_NAME" | tee -a "$LOG_FILE"
else
  echo "Backup failed for directory: $SOURCE_DIR" | tee -a "$LOG_FILE"
fi
