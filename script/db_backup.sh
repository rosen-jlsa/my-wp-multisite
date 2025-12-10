#!/bin/bash
# Взимаме датата
DATE=$(date +%F)
BACKUP_DIR="/opt/wp-multisite/backups"

mkdir -p $BACKUP_DIR

# Backup на базата през Docker
docker exec wp_db mysqldump -u wpms -p'StrongPass!' wp_multisite | gzip > $BACKUP_DIR/db_$DATE.sql.gz

# Backup на файловете (архивираме wp-content папката)
tar -czf $BACKUP_DIR/files_$DATE.tar.gz -C /opt/wp-multisite/wp_data wp-content

# Изтриване на backup-и по-стари от 7 дни
find $BACKUP_DIR -type f -mtime +7 -delete

echo "Backup completed for $DATE"
