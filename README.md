# docker-mysql-oracle-dump

This repository creates database dumps from mysql oracle instances.

The `Dockerfile` contains following procedure:

1.) Copies `start.sh` to `/`

The `start.sh` contains following procedure:

1.) Creates a cronjob `mysqldump` in `/etc/cron.d/` with provided `$CRON_EXPR` for user `root` which executes `/mysqldump.sh` and logs (stdout and stderr) to `/var/log/cron.log`

2.) Creates a `/mysqldump.sh` which actually backups the provided database given by `$DB_HOST` and `$MYSQL_ROOT_PASSWORD` into `$BACKUP_DIR/$BACKUP_FILE` with a timestamp of `date +"%Y%m%d-%H%M".sql.gz`.

