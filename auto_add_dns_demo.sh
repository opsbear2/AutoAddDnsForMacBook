#!/bin/sh

# 为MacBook自动添加网卡的dns

# 定义程序目录
workdir="$HOME/.config/dns"
[ ! -d $HOME/.config/dns ] && mkdir -p $HOME/.config/dns
dnscfg="$HOME/.config/dns/dnslist"

# 获取系统时间
localtime=$(date +%F' '%T)

# 获取MAC扩展坞的网卡名称
network=$(networksetup -listallnetworkservices |grep -E 'USB|LAN')

# 给MAC扩展坞的网卡添加dns
for dnsip in $(cat -n $dnscfg | awk '{print $2}');do
	dnsnum=$(cat -n $dnscfg | grep -w $dnsip | awk '{print $1}')
	mydns_array[$dnsnum]=$dnsip
done
networksetup -setdnsservers "$network" ${mydns_array[*]}

# 检查dns配置是否成功
src_md5=$(cat $dnscfg | md5)
dsc_md5=$(networksetup -getdnsservers "$network" | md5)

if [[ $src_md5 != $dsc_md5 ]];then
	echo "$localtime\tdns add failed, please check" | mail -s "【MAC-DNS配置通知】" $yourmail
fi