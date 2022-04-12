package register

import (
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
)

// PostHandler
// @ID           account.register.post
// @Summary      Generic Login
// @Description  Register
// @Tags         account
// @Accept       json
// @Produce      json
// @Param        payload  body      request  true  "register.request"
// @Success      200      {object}  response
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /account/register [post]
func PostHandler(c *fiber.Ctx) error {

	// * Parse Body
	body := new(request)
	if err := c.BodyParser(&body); err != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	return c.JSON(&responder.InfoResponse{
		Success: true,
		Data: &response{
			Token: "Chuukohin!",
		},
	})
}
