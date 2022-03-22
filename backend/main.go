package main

import (
	"chuukohin/database"
	"chuukohin/deliveries/fiber"
	"fmt"
)

func main() {
	fmt.Println("Hello")
	database.Init()
	fiber.Init()
}
