#!/bin/bash
BACKUP_DIR="/opt/wp-multisite/backups"
mkdir -p $BACKUP_DIR
DATE=$(date +%F)

echo "Starting backup for $DATE..."

# Backup Database
docker exec wp_db mysqldump -u wpms -p'StrongPass!' wp_multisite | gzip > $BACKUP_DIR/db_$DATE.sql.gz

echo "Backup done: $BACKUP_DIR/db_$DATE.sql.gz"
