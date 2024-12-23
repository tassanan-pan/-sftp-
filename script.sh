#!/bin/bash

SFTP_USER="tassanan"
SFTP_HOST="192.168.213.132"
SFTP_PORT="23"
SOURCE_PATH="/opt/test"
DEST_PATH="/home/tassanan"
BACKUP_PATH="/opt/test/backup"
LOG_PATH="/opt/log"

# ส่วนของ SFTP download
sftp -P $SFTP_PORT $SFTP_USER@$SFTP_HOST << EOF
cd $DEST_PATH
get * $SOURCE_PATH/
echo "File transfer completed! get file" >> $LOG_PATH/transfer.log

# ส่วนของการ put ไปไว้ใน BACKUP
lcd $SOURCE_PATH
put * $BACKUP_PATH/
echo "File transfer completed! move file" >> $LOG_PATH/transfer.log

#ส่วนของการลบออกจากของลูกค้า
cd $DEST_PATH
rm * $DEST_PATH/
EOF
