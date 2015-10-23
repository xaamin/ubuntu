## Ubuntu 14.04 dockerfile
This repository contains **Dockerfile** of Ubuntu for Docker's [automated build](https://hub.docker.com/r/xaamin/ubuntu) published to [Docker Hub](https://hub.docker.com) 

### Base docker image
* [ubuntu:14.04](https://registry.hub.docker.com/r/library/ubuntu)

### Installation
* Install [Docker](https://www.docker.com)
* Pull from [Docker Hub](https://hub.docker.com/r/xaamin/ubuntu) `docker pull xaamin/ubuntu`

### Manual build
* Build an image from Dockerfile `docker build -t xaamin/ubuntu https://github.com/xaamin/ubuntu.git`

### Usage
```
	docker run --rm -it xaamin/ubuntu bash
```