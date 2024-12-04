#!/bin/bash

# Environment variables for Restic (set up on Fedora)
export RESTIC_REPOSITORY="sftp:patrickdoe@192.168.56.101:/home/patrickdoe/backup2/"
export RESTIC_PASSWORD="vmtest1"

# Directory to backup (from Ubuntu)
SOURCE_DIR="/home/patrickdoe"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source directory $SOURCE_DIR does not exist!"
  exit 1
fi

# Run Restic backup
restic -r sftp:patrickdoe@192.168.56.101:/home/patrickdoe/backup2/ backup $SOURCE_DIR

# Prune old backups
restic forget --prune --keep-last 5
