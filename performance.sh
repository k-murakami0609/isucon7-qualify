sudo mv /var/log/nginx/access.log /var/log/nginx/access.log.`date "+%s"`
sudo mv /tmp/mysql-slow.sql /tmp/mysql-slow.sql.`date "+%s"`
sudo mv /home/isucon/result.json /home/isucon/result.json.`date "+%s"`

sudo systemctl restart isubata.golang.service nginx.service mysql.service
sleep 5

cd ../../bench/
bin/bench -remotes 127.0.0.1 -output /home/isucon/result.json