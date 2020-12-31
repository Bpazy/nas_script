#!/bin/bash

rsync -av --delete /share/CACHEDEV1_DATA/homes /share/CACHEDEV2_DATA/Backups >> /share/my_cron/rsync/rsync_homes_disk2.log

# gHanHasStarted=$(ssh ziyuan@192.168.31.21 'nc -zw1 192.168.31.10 22; echo $?')

# echo "尝试唤醒 gHan"
# ssh ziyuan@192.168.31.21 '/bin/bash' << EOF
#     cd ~/wol

#     for i in {1..30}
#     do
#         # bash wol-ghan.sh
#         sleep 1
#         aaa=$(nc -zvw1 192.168.31.10 22)
#         echo $aaa
#         if [[ $aaa -eq 0 ]]; then
#             echo fuck
#             exit 0
#         else
#             sleep 5
#         fi
#     done
#     exit 1
# EOF

# if [[ $? -eq 0 ]]; then 
#     echo "唤醒 gHan 成功"
# else 
#     echo "唤醒 gHan 失败"
# fi

# echo "开始备份"
# ssh 192.168.31.10 << EOF
#     wsl rsync -av --delete 192.168.31.20:/share/CACHEDEV1_DATA/homes /mnt/e/Backups
# EOF
# echo "备份完毕"

# if [ $gHanHasStarted -eq 0 ]; then
#     echo "备份前 gHan 是开机状态，现在保持开机状态"
# else 
#     echo "备份前 gHan 是关机状态，现在关闭 gHan"
#     ssh 192.168.31.10 << EOF
#         shutdown -s -t 0
#     EOF
# fi
