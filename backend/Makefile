dev:
	air main.go

ids:
	go mod tidy
	swag init --output ./frameworks/swagger --generalInfo ./frameworks/swagger/index.go
	swag fmt
	go fmt