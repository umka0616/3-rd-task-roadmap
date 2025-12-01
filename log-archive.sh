

#!/bin/bash

LOG_DIR=$1

if [ -z "$LOG_DIR" ]; then
  echo "Usage: $0 <log-directory>"
  exit 1
fi

if [ ! -d "$LOG_DIR" ]; then
  echo "Directory $LOG_DIR does not exist."
  exit 1
fi

ARCHIVE_DIR="./archives"
mkdir -p "$ARCHIVE_DIR"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE_NAME="$ARCHIVE_DIR/logs_archive_$TIMESTAMP.tar.gz"

tar -czf "$ARCHIVE_NAME" -C "$LOG_DIR" .

echo "$(date '+%Y-%m-%d %H:%M:%S') Archived logs to $ARCHIVE_NAME" >> "$ARCHIVE_DIR/archive.log"

echo "Logs have been archived to $ARCHIVE_NAME"
