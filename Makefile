GOPATH := ${PWD}
export GOPATH

build:
	go build -v isubata

vet:
	go vet ./src/isubata/...

alp:
	sudo cat /var/log/nginx/access.log | alp ltsv -m "/icons/.+,/history/.+,/profile/.+,/channel/.+,/fonts/.+,/js/.+"

query:
	sudo pt-query-digest /tmp/mysql-slow.txt

create:
	sh build.sh

performance:
	sh performance.sh

nginx:
	sudo systemctl restart nginx.service

mysql:
	sudo systemctl restart mysql.service
