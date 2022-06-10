package profile

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/utils/check"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// ProfilePatchHandler
// @ID           me.profile.patch
// @Summary      Update user information
// @Description  Update user information
// @Tags         me
// @Accept       json
// @Produce      json
// @Param        payload  body      profilePatchRequest  true  "profile.profilePatchRequest"
// @Success      200      {object}  responder.InfoResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /me/profile/edit [patch]
func ProfilePatchHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Parse body
	body := new(profilePatchRequest)
	if err := c.BodyParser(&body); err != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	// * Validate Body
	if err := check.Validator.Struct(body); err != nil {
		return &responder.GenericError{
			Message: "Validate body failed",
			Err:     err,
		}
	}

	user := &models.User{
		Firstname: body.Firstname,
		Lastname:  body.Lastname,
		Email:     body.Email,
	}

	// * Update the user profile
	if result := database.Gorm.First(new(models.User), "id = ?", claims.UserId).Updates(&user); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to update the user profile",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Update the user information successfully"))
}
