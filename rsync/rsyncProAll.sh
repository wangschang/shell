#!/bin/bash
#author by shuchang 2017-02-03
#rsync file to product folder
#把代码同步到固定ip上去
echo -e "你要同步代码到正式机上"
echo -n "Please type[Y/N]:"
read input
ret=$input
func_rsync(){
    IP=$1
    echo -e  "begin rsync file to $IP....."
    sudo rsync -avz  --exclude-from=./exclude.list --delete /data/product/current/  root@
$IP::front/Server
    echo -e  "rsync $IP complete!"
    echo -e " "
}

if [ $ret = "Y" ];then
    func_rsync 10.0.0.101
    func_rsync 10.0.0.102
else
    echo "type error quit !"
    exit
fi
