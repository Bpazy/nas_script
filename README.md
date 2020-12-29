# nas_script
个人使用的 NAS 相关脚本。

## 磁盘相关
### 系统 RAID1
系统 RAID1 博文：https://blog.csdn.net/hanziyuan08/article/details/104933718

**fail_raid1.sh**: 关闭系统 RAID1，使其他磁盘不工作，可进入休眠状态；  
**readd_raid1.sh**: 开启系统 RAID1，同步系统数据，防止系统盘崩溃；  
**raid1_monitor.sh**: 监控系统 RAID1 状态；  

```crontab
0 0 * * * /bin/bash /share/CACHEDEV1_DATA/my_cron/readd_raid1.sh
15 0 * * * /bin/bash /share/CACHEDEV1_DATA/my_cron/fail_raid1.sh
*/10 * * * * /bin/bash /share/CACHEDEV1_DATA/my_cron/raid1_monitor.sh
```

## 虚拟机相关 
**printer_1020_plus_attacher.sh**: 检测到打印机则将打印机转接到虚拟机中；
```crontab
*/1 * * * * /bin/bash /share/my_cron/printer_1020_plus_attacher.sh
```

## 备份相关
**rsync/rsync_homes**: 将系统盘中的 homes 目录备份至第二块磁盘；
```crontab
0 0 * * * /bin/bash /share/CACHEDEV1_DATA/my_cron/rsync/rsync_homes.sh
```
