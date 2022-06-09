package main

import (
	"chuukohin/database"
	"chuukohin/frameworks/fiber"
	"chuukohin/utils/storage"
)

func main() {
	storage.Init()
	database.Init()
	fiber.Init()
}
