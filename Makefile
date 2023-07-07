build_docker_prod:
		docker build -t ndee-blog -f ~/Dev/ndee-blog/Docker/Dockerfile.prod .

docker_prod: build_docker_prod
		docker run -it -p 8080:8080 --rm --name ndee-blog-1 ndee-blog
