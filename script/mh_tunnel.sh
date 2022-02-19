#!/bin/bash
pid=`ps -ef | grep "mh_tunnel" | grep -v "grep" | grep -v "mh_tunnel.sh"  | awk '{print $2}'`
if [ -n "$pid" ]
then
	echo "kill running mh_tunnel $pid"
	kill -9 $pid
fi
args=$*
rm -rf /mh_tunnel/mh_tunnel
mkdir /mh_tunnel




wget --no-check-certificate  https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@main/release/v2.2/mh_tunnel  -O /mh_tunnel/mh_tunnel
wget --no-check-certificate  https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@main/release/v2.2/config.yml  -O /mh_tunnel/config.yml
wget --no-check-certificate  https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@main/release/v2.2/encrypt.yml  -O /mh_tunnel/encrypt.yml

cd /mh_tunnel

chmod +x /mh_tunnel/mh_tunnel
nohup /mh_tunnel/mh_tunnel &

rm -rf /etc/rc.local
cat >> /etc/rc.local << EOF
nohup /mh_tunnel/mh_tunnel &
exit 0
EOF
chmod +x /etc/rc.local

exit 0


