package login

import (
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
)

// PostHandler
// @ID           account.login.post
// @Summary      Generic Login
// @Description  Default login handler with email and password
// @Tags         account
// @Accept       json
// @Produce      json
// @Param        payload  body      request  true  "login.request"
// @Success      200      {object}  response
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /account/login [post]
func PostHandler(c *fiber.Ctx) error {
	// * Parse JWT
	//user := c.Locals("user").(*jwt.Token)
	//claims := user.Claims.(*jwt_claim.UserClaim)

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
