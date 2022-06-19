package main

import (
	"chuukohin/database"
	"chuukohin/frameworks/fiber"
	"chuukohin/repository"
	"chuukohin/utils/storage"
)

func main() {
	db, _ := repository.Init()

	storage.Init()
	database.Init()
	fiber.Init(db)
}
