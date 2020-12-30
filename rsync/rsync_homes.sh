#!/bin/sh

rsync -av --delete /share/CACHEDEV1_DATA/homes /share/CACHEDEV2_DATA/Backups >> /share/my_cron/rsync/rsync_homes_disk2.log

echo "Try to wake up gHan"
ssh ziyuan@192.168.31.21 << EOF
    cd ~/wol
    for i in {1..10}
    do
        bash wol-ghan.sh
        nc -zw1 192.168.31.10 22
        if [ $? -eq 0 ]; then
            break
        else
            echo "gHan not initiated"
        fi
    done
EOF
echo "Wake up gHan success"

ssh 192.168.31.10 << EOF
    wsl rsync -av --delete 192.168.31.20:/share/CACHEDEV1_DATA/homes /mnt/e/Backups
EOF
