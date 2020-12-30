#!/bin/sh

rsync -av --delete /share/CACHEDEV1_DATA/homes /share/CACHEDEV2_DATA/Backups >> /share/my_cron/rsync/rsync_homes_disk2.log

# ssh ziyuan@192.168.31.21 << EOF
#     cd ~/wol
#     echo 123
# EOF
