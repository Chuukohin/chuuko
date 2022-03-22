package login

import (
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
)

func GetHandler(c *fiber.Ctx) error {
	return c.JSON(&responder.InfoResponse{
		Success: true,
		Data: &responder.GenericError{
			Message: "Test",
		},
	})
}
