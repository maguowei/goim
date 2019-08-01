.PHONY : build

include .env
export

all: test build

init:
	go mod vendor

build:
	docker build -t maguowei/goim .

build-discovery:
	docker build -t maguowei/discovery -f discovery.Dockerfile .

#run:
#	nohup go run -mod=vendor cmd/logic/main.go -conf=configs/logic-example.toml
#	nohup go run -mod=vendor cmd/comet/main.go -conf=configs/comet-example.toml
#	nohup go run -mod=vendor cmd/job/main.go -conf=configs/job-example.toml

up:
	docker-compose up -d

stop:
	docker-compose stop

down:
	docker-compose down

logs:
	docker-compose logs -f

test:
	go test -v ./...
