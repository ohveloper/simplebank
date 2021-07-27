postgres:
	docker container run --name postgres12 -d -e POSTGRES_PASSWORD=876876 -e POSTGRES_USER=root -p 5432:5432 postgres:13-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres12 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:876876@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:876876@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate 

.PHONY: postgres createdb dropdb migrateup migratedown sqlc