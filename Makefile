# Load environment variables from .env file
include .env

postgres:
	docker run --name postgres16 -p 5432:5432 -e POSTGRES_USER=${DB_USER} -e POSTGRES_PASSWORD=${DB_PASSWORD} -d postgres:16-alpine

createdb:
	docker exec -it postgres16 createdb --username=${DB_USER} --owner=${DB_USER} simple_bank

dropdb:
	docker exec -it postgres16 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://${DB_USER}:${DB_PASSWORD}@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://${DB_USER}:${DB_PASSWORD}@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown