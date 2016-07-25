IMG = nginx-root
INST = nginx-root1

build:
	docker build -t $(IMG) .

run:
	docker run --name $(INST) -d -p 80:80 $(IMG)

update:
	docker cp index.html $(INST):/usr/share/nginx/html/html
	docker cp nginx.conf $(INST):/etc/nginx/nginx.conf
	docker exec $(INST) nginx -s reload

clean:
	docker rm -f $(shell docker ps -a | grep $(INST) | cut -b 1-12)

stopnrun: stopnrun1

stopnrun1: stopnrun2 run

stopnrun2: stopnrun3 build

stopnrun3: clean
