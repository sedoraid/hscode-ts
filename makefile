.PHONY: build
build:
	docker build --no-cache -t hscode .

.PHONY: up
up:
	docker run -it --init --rm --name hscode -v $$(pwd):/hscode hscode bash
