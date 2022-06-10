package password

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/utils/check"
	"chuukohin/utils/crypto"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// PasswordPatchHandler
// @ID           me.password.patch
// @Summary      Update user password
// @Description  Update user password
// @Tags         me
// @Accept       json
// @Produce      json
// @Param        payload  body      passwordPatchRequest  true  "password.passwordPatchRequest"
// @Success      200      {object}  responder.InfoResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /me/password/edit [patch]
func PasswordPatchHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Parse Body
	body := new(passwordPatchRequest)
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

	// * Fetch the user
	var user *models.User
	if result := database.Gorm.First(&user, "id = ?", claims.UserId); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to find the user",
			Err:     result.Error,
		}
	}

	// * Check current password
	if !crypto.ComparePassword(*user.Password, *body.CurrentPassword) {
		return &responder.GenericError{
			Message: "Current password is incorrect",
		}
	}

	// * Hash password
	hashedPassword, _ := crypto.HashPassword(body.NewPassword)

	user.Password = &hashedPassword

	// * Update the user's password
	if result := database.Gorm.Updates(user); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to update the password",
			Err:     result.Error,
		}
	}
	return c.JSON(responder.NewInfoResponse("Update password successfully"))
}
