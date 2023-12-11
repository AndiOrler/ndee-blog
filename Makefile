
# set default target
.DEFAULT_GOAL := help

help:
	@echo "Hello from help"
	@echo " "
	@echo "Make cmd's "
	@echo " "
	@echo "- docker_prod                               build and run docker prod cotainer"
	@echo "- docker_dev                                build and run docker dev cotainer"
	@echo "- build_docker_prod                         build prod image"
	@echo "- build_docker_dev                          build dev image"
	@echo "- docker_push                               push prod img to docker hub"

build_docker_prod:
	docker build -t ndee-blog -f ~/dev/ndee-blog/docker/Dockerfile.prod .

docker_prod: build_docker_prod
	docker run -it -p 8080:80 --rm --name ndee-blog-1 ndee-blog

build_docker_dev:
	docker build -t ndee-blog-dev -f ~/dev/ndee-blog/docker/Dockerfile.dev .

docker_dev: build_docker_dev
	docker run -it -p 8080:8080 --rm --name ndee-blog-1 ndee-blog-dev

docker_push:
	@if [ $(shell docker images -q ndee-blog 2> /dev/null) ]; then \
		echo "Removing Docker image: ndee-blog"; \
		docker rmi ndee-blog; \
	fi

	docker build -t ndee-blog -f ~/dev/ndee-blog/docker/Dockerfile.prod .
	docker tag ndee-blog dockerndee/ndee-blog
	docker push dockerndee/ndee-blog


