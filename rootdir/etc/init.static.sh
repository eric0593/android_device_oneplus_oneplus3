#!/system/bin/sh

whatsapp=`cat /data/system/packages.list | grep "com.whatsapp"  | cut -d ' ' -f 2`
keep=`cat /data/system/packages.list | grep "com.gotokeep.keep"  | cut -d ' ' -f 2`
alipay=`cat /data/system/packages.list | grep "com.eg.android.AlipayGphone"  | cut -d ' ' -f 2`
baicizhan=`cat /data/system/packages.list | grep "com.jiongji.andriod.card"  | cut -d ' ' -f 2`
mobikeapp=`cat /data/system/packages.list | grep "com.mobike.mobikeapp"  | cut -d ' ' -f 2`
minimap=`cat /data/system/packages.list | grep "com.autonavi.minimap"  | cut -d ' ' -f 2`
qqmail=`cat /data/system/packages.list | grep "com.tencent.androidqqmail"  | cut -d ' ' -f 2`
liulishuo=`cat /data/system/packages.list | grep "com.liulishuo.engzo"  | cut -d ' ' -f 2`

iptables -F fw_OUTPUT
iptables -A fw_OUTPUT -m time --timestart 00:00 --timestop 00:30  -j REJECT
iptables -A fw_OUTPUT -m time --timestart 14:45 --timestop 23:59  -j REJECT
iptables -I  fw_OUTPUT  -m owner --uid-owner ${whatsapp} -j RETURN
iptables -I  fw_OUTPUT  -m owner --uid-owner ${keep} -j RETURN
iptables -I  fw_OUTPUT  -m owner --uid-owner ${alipay} -j RETURN
iptables -I  fw_OUTPUT  -m owner --uid-owner ${baicizhan} -j RETURN
iptables -I  fw_OUTPUT  -m owner --uid-owner ${minimap} -j RETURN
iptables -I  fw_OUTPUT  -m owner --uid-owner ${qqmail} -j RETURN
iptables -I  fw_OUTPUT  -m owner --uid-owner ${liulishuo} -j RETURN
iptables -I  fw_OUTPUT  -m owner --uid-owner ${mobikeapp} -j RETURN
iptables -I  fw_OUTPUT  -m owner --uid-owner 0 -j RETURN
iptables -I  fw_OUTPUT  -m owner --uid-owner 1000 -j RETURN
