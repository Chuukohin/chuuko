package login

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/utils/check"
	"chuukohin/utils/crypto"
	"chuukohin/utils/header"
	"github.com/gofiber/fiber/v2"
)

// PostHandler
// @ID           account.login.post
// @Summary      Login
// @Description  Default login handler with email and password
// @Tags         account
// @Accept       json
// @Produce      json
// @Param        payload  body      login.loginRequest  true  "login.loginRequest"
// @Success      200      {object}  login.loginResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /account/login [post]
func PostHandler(c *fiber.Ctx) error {
	// * Parse Body
	body := new(loginRequest)
	if err := c.BodyParser(&body); err != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	// * Validate body
	if err := check.Validator.Struct(body); err != nil {
		return err
	}

	// * Get User
	var user *models.User
	if result := database.Gorm.First(&user, "email = ?", body.Email); result.RowsAffected == 0 {
		return &responder.GenericError{
			Message: "User not found",
			Err:     result.Error,
		}
	}

	// * Check password
	if !crypto.ComparePassword(*user.Password, *body.Password) {
		return &responder.GenericError{
			Message: "Password or email is incorrect",
		}
	}

	// * Create claims
	claims := &jwt_claim.UserClaim{
		UserId: user.Id,
	}

	// * Check Seller
	var shop *models.Shop
	if result := database.Gorm.First(&shop, "user_id = ?", user.Id); result.RowsAffected != 0 {
		claims.SellerId = shop.Id
	} else {
		sellerId := uint64(0)
		claims.SellerId = &sellerId
	}

	// * Sign JWT
	token, err := header.SignJwt(claims)
	if err != nil {
		return nil
	}

	return c.JSON(responder.NewInfoResponse(&loginResponse{
		Token: token,
	}))
}
