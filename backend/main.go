package main

import (
	"chuukohin/database"
	"chuukohin/deliveries/fiber"
)

func main() {
	database.Init()
	fiber.Init()
}
