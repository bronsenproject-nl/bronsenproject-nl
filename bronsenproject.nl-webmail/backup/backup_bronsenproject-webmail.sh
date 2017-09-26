#!/bin/bash

BASE_PATH=`pwd`

source ${BASE_PATH}/utils/read_configuration.sh

read_config "/home/config/bronsenproject_webmail.properties"

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/backup/bronsenproject.nl/today
WWW_DIR=/home/sites
MAIL_DIR=/home/mail
POSTFIX_CONFIG_DIR=/home/config/postfix/
DOVECOT_CONFIG_DIR=/home/config/dovecot/

echo "***************************************************************"
echo "* Commence backup webmail.bronsenporject.nl                   *"
echo "***************************************************************"

echo "[INFO] Backup MySQL schema : ${SQL_SCHEMA}"
mysqldump -u ${SQL_USER} -p${SQL_PASSWORD} ${SQL_SCHEMA} --host=${SQL_HOST} --port=${SQL_PORT}  > ${BASE_DIR}/${DATE}_bronsenproject_mail.sql

echo "[INFO] Backup data directory : ${WWW_DIR}/webmail.bronsenproject.nl/"
tar -cvf ${BASE_DIR}/${DATE}_bronsenproject_mail.tar ${WWW_DIR}/webmail.bronsenproject.nl/
echo "[INFO] Backup POSTFIX-configuration : ${POSTFIX_CONFIG_DIR}"
tar -cvf ${BASE_DIR}/${DATE}_bronsenproject_postfix.tar ${POSTFIX_CONFIG_DIR}
echo "[INFO] Backup DOVECOT-configuration : ${DOVECOT_CONFIG_DIR}"
tar -cvf ${BASE_DIR}/${DATE}_bronsenproject_mail_dovecot.tar ${DOVECOT_CONFIG_DIR}
echo "[INFO] Backup mail data directory: ${MAIL_DIR}/bronsenproject.nl"
tar -cvf ${BASE_DIR}/${DATE}_bronsenproject_mail_maildir.tar ${MAIL_DIR}/bronsenproject.nl

echo "***************************************************************"





