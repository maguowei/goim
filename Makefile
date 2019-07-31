.PHONY : build

all: test build


init:
	go mod vendor

build:
	docker build -t maguowei/goim .

run:
	nohup go run -mod=vendor cmd/logic/main.go -conf=target/logic.toml -region=sh -zone=sh001 -deploy.env=dev -weight=10 2>&1 > target/logic.log &
	nohup go run -mod=vendor cmd/comet/main.go -conf=target/comet.toml -region=sh -zone=sh001 -deploy.env=dev -weight=10 -addrs=127.0.0.1 -debug=true 2>&1 > target/comet.log &
	nohup go run -mod=vendor cmd/job/main.go -conf=target/job.toml -region=sh -zone=sh001 -deploy.env=dev 2>&1 > target/job.log &

up:
	docker-compose up -d

down:
	docker-compose down

test:
	go test -v ./...
