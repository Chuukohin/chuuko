package main

import (
	"chuukohin/database"
	"chuukohin/frameworks/fiber"
)

func main() {
	database.Init()
	fiber.Init()
}
