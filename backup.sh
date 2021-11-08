#!/bin/bash
# requires rclone and ts
# apt install rclone moreutils
#
# setup rclone remote "unifi-backup"
# rclone config
#
# set cron using crontab -e
# 2 2 * * * /bin/bash -c 'cd ~/unifi-controller; ./backup.sh'
do_backup() {
	echo "Unifi backup rclone BEGIN"
	rclone sync -v config/data/backup/ unifi-backup:backup/unifi/
	echo "Unifi backup rclone END"
}

do_backup 2>&1 | ts '%Y-%m-%d %H:%M:%S' | tee -a config/logs/backup-rclone.log
