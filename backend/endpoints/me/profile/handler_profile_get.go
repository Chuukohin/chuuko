package profile

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// ProfileGetHandler
// @ID           me.profile.get
// @Summary      Get user info
// @Description  Get user info
// @Tags         me
// @Accept       json
// @Produce      json
// @Success      200  {object}  profile.profileGetResponse
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /me/profile/info [get]
func ProfileGetHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Fetch the user data
	var user *models.User
	if result := database.Gorm.First(&user, "id", claims.UserId); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to find the user",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse(&profileGetResponse{
		Email:     user.Email,
		Firstname: user.Firstname,
		Lastname:  user.Lastname,
	}))
}
