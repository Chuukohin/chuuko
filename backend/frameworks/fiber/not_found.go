package fiber

import (
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
)

func notFound(ctx *fiber.Ctx) error {
	return ctx.Status(fiber.StatusNotFound).JSON(&responder.ErrorResponse{
		Success: false,
		Error:   "404 Not Found",
		Code:    fiber.StatusNotFound,
	})
}
