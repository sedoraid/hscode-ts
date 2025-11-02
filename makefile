.PHONY: build
build:
	docker build --no-cache -t hscode-ts .

.PHONY: up
up:
	docker run -it --init --rm --name hscode-ts -v $$(pwd):/hscode-ts hscode-ts bash
