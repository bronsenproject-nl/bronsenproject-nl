#!/bin/bash

BASE_PATH=`pwd`

source ${BASE_PATH}/utils/read_configuration.sh

read_config "/home/config/bronsenproject_site.properties"

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/backup/bronsenproject.nl/today
WWW_DIR=/home/sites

echo "***************************************************************"
echo "* Commence backup www.bronsenproject.nl                       *"
echo "***************************************************************"

echo "[INFO] Backup MySQL schema : ${SQL_SCHEMA}"
mysqldump -u ${SQL_USER} -p${SQL_PASSWORD} ${SQL_SCHEMA} --host=${SQL_HOST} --port=${SQL_PORT} > ${BASE_DIR}/${DATE}_bronsenproject.sql
if [[ ${?} != 0 ]]; then
  echo "[ERROR] mysqldump failed"
  exit 1
fi

echo "[INFO] Backup data directory : ${WWW_DIR}/wwww.bronsenproject.nl/"
tar -cvf ${BASE_DIR}/${DATE}_bronsenproject.tar ${WWW_DIR}/www.bronsenproject.nl/

echo "***************************************************************"