#! make

build:
	docker build -t alpine-minio-client .

test:
	docker run --rm -it alpine-minio-client mc alias ls

compare:
	docker image ls | egrep "alpine-minio-client|minio/mc"
