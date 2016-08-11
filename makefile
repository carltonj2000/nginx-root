IMG = nginx-root
INST = nginx-root1

HTML = /home/carltonj2000/cj/cjSourceControlled/carltonj2000/home-server/build

build:
	docker build -t $(IMG) .

run:
	docker run --name $(INST) -d -p 80:80 \
	-v $(HTML):/usr/share/nginx/html \
	$(IMG)

runAlways:
	docker run --restart=always --name $(INST) -d -p 80:80 \
	-v $(HTML):/usr/share/nginx/html \
	$(IMG)

update:
	docker cp nginx.conf $(INST):/etc/nginx/nginx.conf
	docker exec $(INST) nginx -s reload

clean:
	docker rm -f $(shell docker ps -a | grep $(INST) | cut -b 1-12)

rerun: stopnrun1 run

stopnrun1: stopnrun2 build

stopnrun2: clean
