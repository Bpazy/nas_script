#!/bin/sh

mdadm /dev/md9 --fail /dev/sdb1
mdadm /dev/md13 --fail /dev/sdb4
