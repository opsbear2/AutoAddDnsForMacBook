# AutoAddDnsForMacBook



[TOC]



## 自动配置Macbook的DNS



### 项目简介

------

插拔Macbook的扩展坞后，网卡的DNS会重置为空，每次都需要手动添加。使用以下工具配合MacBook自带的`crontab`功能，可完美解放双手🙌🏻



### 安装部署

1、下载脚本和dnslist

```shell
wget "https://github.com/0b631a794ad5ba48e99c083d6b9b0f10/AutoAddDnsForMacBook/blob/199b75bf615b019eff0a1027c1bcd341a7d40b18/auto_add_dns.sh"
wget "https://github.com/0b631a794ad5ba48e99c083d6b9b0f10/AutoAddDnsForMacBook/blob/199b75bf615b019eff0a1027c1bcd341a7d40b18/dnslist"
```



dnslist可自定义添加

```shell
8.8.8.8						#谷歌dns	
114.114.114.114		#百度dns
223.5.5.5					#阿里dns
```



2、添加crontab

```shell
# 工作日(周一到周五)的10点10分执行
10 10 * * 1-5 sh $HOME/.config/dns/auto_add_dns.sh >/dev/null 2>&1
``



