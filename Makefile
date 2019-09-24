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

save:
	sh save.sh

cpu:
	curl -s http://localhost:6060/debug/pprof/profile > /tmp/cpu.pprof

heap
	curl -s http://localhost:6060/debug/pprof/heap > /tmp/heap.pprof

cprofile:
	go tool pprof isubata /tmp/cpu.pprof

hprofile:
	go tool pprof isubata /tmp/heap.pprof