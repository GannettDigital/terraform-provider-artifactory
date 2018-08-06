GOFMT_FILES?=$$(find . -name '*.go' | grep -v vendor)
PROJDIR := $(realpath $(CURDIR))
SOURCEDIR := $(PROJDIR)/
BUILDDIR := $(PROJDIR)/dist

all: test build

dep:
	@misc/scripts/deps-ensure
	@dep ensure -v

fmt:
	@gofmt -s -w .

test:
	@go test -v ./...
	@go vet ./...

.PHONY: clean build
clean:
	-@rm -rf ./dist/
