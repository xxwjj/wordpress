
all: docker 

docker:
	docker build . -t xxwjj/wordpress:latest

clean:
	docker rmi xxwjj/wordpress:latest
