#!/bin/bash
cat <<EOF > /etc/crontab/mysqldump
$CRON_EXPR root /mysqldump.sh >> /var/log/cron.log 2>&1
EOF
chmod 0644 /etc/crontab/mysqldump

cat <<EOF > /mysqldump.sh
#!/bin/bash
/usr/bin/mysqldump --verbose -h $DB_HOST --all-databases --ignore-table=mysql.event -uroot -p$MYSQL_ROOT_PASSWORD | gzip > $BACKUP_DIR/$BACKUP_FILE-\$(date +"%Y%m%d-%H%M").sql.gz
EOF
chmod 0755 /mysqldump.sh

/usr/sbin/cron

touch /var/log/cron.log && tail -f /var/log/cron.log
