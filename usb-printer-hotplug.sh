#!/bin/bash
# /usr/local/sbin/attach_usb.sh
# This script will attach inserted USB device to first running VM

VM="39d664db-d642-4922-9ddd-ccca6b372b9d"
CONF="/share/my_cron/printer_1020_plus.xml"

echo `date` $ACTION $VM $CONF `env` >> /share/my_cron/result.log

if [ "${ACTION}" == 'add' ]; then
  /QVS/usr/bin/virsh attach-device $VM $CONF --current
elif [ "${ACTION}" == 'remove' ]; then
  /QVS/usr/bin/virsh detach-device $VM $CONF --current
fi

echo `date` "执行完毕" >> /share/my_cron/result.log

# SUBSYSTEM=="usb",ENV{DEVPATH}=="/devices/pci0000:00/0000:00:15.0/usb1/1-3",RUN+="/share/my_cron/usb-printer-hotplug.sh"
# udevadm monitor --env
# mount $(/sbin/hal_app --get_boot_pd port_id=0)6 /tmp/config
# vim /tmp/config/autorun.sh
# umount /tmp/config