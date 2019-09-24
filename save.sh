datetime=`date "+%s"`
workdir=/home/isucon/result/${datetime}

mkdir -p ${workdir}
sudo cat /var/log/nginx/access.log | alp ltsv -m "/icons/.+,/history/.+,/profile/.+,/channel/.+,/fonts/.+,/js/.+" > ${workdir}/alp.txt
sudo pt-query-digest /tmp/mysql-slow.txt > ${workdir}/mysql-slow.txt
sudo cp /home/isucon/result.json ${workdir}/result.json

echo "変更内容"
read title
score=`cat /home/isucon/result.json | jq .score`
QUERY="INSERT INTO result (title, score) VALUES ('${title}', ${score});"
mysql -u isucon -p isucon -e "$QUERY"

echo $title > ${workdir}/README.md