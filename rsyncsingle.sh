#!/bin/bash
#author by shuchang 2017-02-03
#rsync file to product folder
# /data/shell/exclude.list 是忽略的目录内容为.svn 
#把代码同步到单个服务器上去
IP=$1
if [ -z "$IP" ]
then
    echo "请输入要同步的机器IP 例如[./rsyncProSingle.sh 10.0.1.5 ]"
    exit
fi

echo -e "你要同步代码到 $IP 上"
echo -n "Please type[Y/N]:"
read input
ret=$input
func_rsync(){
    IP=$1
    echo -e  "begin rsync file to $IP....."
    sudo rsync -avz  --exclude-from=/data/shell/exclude.list --delete /data/product/  root@$IP::product/Server
    echo -e  "rsync $IP complete!"
}

if [ $ret = "Y" ];then
    func_rsync $IP
else
    echo "type error quit !"
    exit
fi
