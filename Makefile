.PHONY: build
build:
	./build

.PHONY: format
format:
	test -z "$$(find . -path ./vendor -prune -type f -o -name '*.go' -exec gofmt -d {} + | tee /dev/stderr)" || \
	test -z "$$(find . -path ./vendor -prune -type f -o -name '*.go' -exec gofmt -w {} + | tee /dev/stderr)"

.PHONY: test
test: build
	./test

.PHONY: test-with-cover
test-with-cover: build
	./test with-cover
