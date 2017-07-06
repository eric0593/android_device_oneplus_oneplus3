#!/system/bin/sh
wangzherongyao=`cat /data/system/packages.list | grep "com.tencent.tmgp.sgame"  | cut -d ' ' -f 2`
gameon=`getprop persist.sys.game.on`
iptables -F fw_OUTPUT
if [ "$gameon" = "true" ];then
iptables -I  oem_out  -m owner --uid-owner ${wangzherongyao} -j RETURN
else
iptables -I  oem_out  -m owner --uid-owner ${wangzherongyao} -j REJECT
fi