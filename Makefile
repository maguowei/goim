.PHONY : build

all: test build


init:
	go mod vendor

build:
	docker build -t maguowei/goim .

#build:
#	rm -rf target/
#	mkdir target/
#	cp cmd/comet/comet-example.toml target/comet.toml
#	cp cmd/logic/logic-example.toml target/logic.toml
#	cp cmd/job/job-example.toml target/job.toml
#	$(GOBUILD) -o target/comet cmd/comet/main.go
#	$(GOBUILD) -o target/logic cmd/logic/main.go
#	$(GOBUILD) -o target/job cmd/job/main.go

run:
	nohup target/logic -conf=target/logic.toml -region=sh -zone=sh001 -deploy.env=dev -weight=10 2>&1 > target/logic.log &
	nohup target/comet -conf=target/comet.toml -region=sh -zone=sh001 -deploy.env=dev -weight=10 -addrs=127.0.0.1 -debug=true 2>&1 > target/comet.log &
	nohup target/job -conf=target/job.toml -region=sh -zone=sh001 -deploy.env=dev 2>&1 > target/job.log &

up:
	docker-compose up -d

down:
	docker-compose down

test:
	go test -v ./...