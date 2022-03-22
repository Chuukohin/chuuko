package fiber

import (
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
)

func errorHandler(ctx *fiber.Ctx, err error) error {
	code := fiber.StatusInternalServerError
	message := ""

	// Retrieve the custom status code if it's an fiber.*Error
	if e, ok := err.(*fiber.Error); ok {
		code = e.Code
		message = e.Message
	}

	if err != nil {
		return ctx.Status(fiber.StatusInternalServerError).JSON(&responder.ErrorResponse{
			Success: false,
			Code:    code,
			Message: message,
			Error:   err.Error(),
		})
	}

	// Return from handler
	return nil
}
