#!/bin/sh

echo `date` `hdparm -C /dev/sdb | grep state` >> /share/CACHEDEV1_DATA/my_cron/raid1_monitor.log 2>&1
