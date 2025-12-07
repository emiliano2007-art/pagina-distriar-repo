.PHONY: run test build up down logs

build:
	docker-compose -f docker-compose.yml build --no-cache

up: build
	docker-compose -f docker-compose.yml up -d

down:
	docker-compose -f docker-compose.yml down

logs:
	docker-compose -f docker-compose.yml logs -f

test:
	pytest -vv
