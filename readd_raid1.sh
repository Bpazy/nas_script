#!/bin/sh

mdadm /dev/md9 --re-add /dev/sdb1
mdadm /dev/md13 --re-add /dev/sdb4
