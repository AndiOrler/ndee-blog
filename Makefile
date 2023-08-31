
# set default target
.DEFAULT_GOAL := help

help:
	@echo "Hello from help"
	@echo " "	
	@echo "Make cmd's "
	@echo "- docker_prod                               build and run docker prod cotainer"
	@echo "- docker_dev                                build and run docker dev cotainer"
	@echo " "

build_docker_prod:
	docker build -t ndee-blog -f ~/dev/ndee-blog/docker/Dockerfile.prod .

docker_prod: build_docker_prod
	docker run -it -p 8080:8080 --rm --name ndee-blog-1 ndee-blog

build_docker_dev:
	docker build -t ndee-blog-dev -f ~/dev/ndee-blog/docker/Dockerfile.dev .

docker_dev: build_docker_dev
	docker run -it -p 8080:8080 --rm --name ndee-blog-1 ndee-blog-dev
