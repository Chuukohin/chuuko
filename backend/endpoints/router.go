package endpoints

import (
	"chuukohin/endpoints/account/login"
	"github.com/gofiber/fiber/v2"
)

func Router(router fiber.Router) {
	account := router.Group("account/")
	account.Get("/login", login.GetHandler)
}
