#!/bin/bash
# set -x
set -euo pipefail

# 宿主机是否连接设备
HOST_ATTACHED=0
# 虚拟机是否已连接设备
VM_ATTACHED=0
# 虚拟机名称
NAME="39d664db-d642-4922-9ddd-ccca6b372b9d"
# USB 打印机的 XML 描述文件
XML_PATH="/share/my_cron/printer_1020_plus.xml"
# 本脚本工作的日志路径
LOG_PATH="/share/my_cron/printer_1020_plus_attach.log"
# USB 设备名称
DEVICE_NAME_FRAGMENT="LaserJet\ 1020"

if /QVS/usr/bin/virsh qemu-monitor-command --domain $NAME --hmp --cmd "info usb" | grep -q "$DEVICE_NAME_FRAGMENT"; then
	VM_ATTACHED=1
fi
if lsusb | grep -q "$DEVICE_NAME_FRAGMENT"; then
	HOST_ATTACHED=1
fi

# 如果虚拟机没有连接设备，且宿主机连接了设备，则将设备分配给虚拟机
if [ $VM_ATTACHED -eq 0 ] && [ $HOST_ATTACHED -eq 1 ]; then
	/QVS/usr/bin/virsh attach-device $NAME $XML_PATH > /dev/null
	MSG="`date` attached_printer"
	echo $MSG >> $LOG_PATH
fi

# 虚拟机连接了设备，但是宿主机没有该设备，则意味着设备是通过断电离线的，需要排除
# 此场景只出现了一次，暂不能确定具体原因
if [ $VM_ATTACHED -eq 1 ] && [ $HOST_ATTACHED -eq 0 ]; then
	/QVS/usr/bin/virsh detach-device $NAME $XML_PATH > /dev/null
	MSG="`date` detached_printer"
	echo $MSG >> $LOG_PATH
fi
