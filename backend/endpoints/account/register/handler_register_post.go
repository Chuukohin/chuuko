package register

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/utils/check"
	"chuukohin/utils/crypto"
	"chuukohin/utils/header"
	"github.com/gofiber/fiber/v2"
	"time"
)

// PostHandler
// @ID           account.register.post
// @Summary      Register
// @Description  Register
// @Tags         account
// @Accept       json
// @Produce      json
// @Param        payload  body      registerRequest  true  "register.registerRequest"
// @Success      200      {object}  register.registerResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /account/register [post]
func PostHandler(c *fiber.Ctx) error {

	// * Parse Body
	body := new(registerRequest)
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

	// * Validate Password
	if err := check.ValidatePassword(*body.Password); err != nil {
		return err
	}

	// * Check Duplicated Email
	var checkDuplicateUser *models.User
	if result := database.Gorm.First(&checkDuplicateUser, "email = ?", body.Email); result.Error == nil {
		return &responder.GenericError{
			Message: "Duplicated email",
		}
	}

	// * Compare Password
	if *body.Password != *body.ConfirmPassword {
		return &responder.GenericError{
			Message: "The Password confirmation does not match",
		}
	}

	// * Hash Password
	hashedPassword, _ := crypto.HashPassword(*body.Password)

	currentDate := time.Now()

	user := &models.User{
		Firstname: body.Firstname,
		Lastname:  body.Lastname,
		Password:  &hashedPassword,
		Email:     body.Email,
		JoinDate:  &currentDate,
	}

	// * Create User
	if result := database.Gorm.Create(&user); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to create user",
			Err:     result.Error,
		}
	}

	// * Create Claims
	claims := &jwt_claim.UserClaim{
		UserId: user.Id,
	}

	// * Sign JWT
	token, err := header.SignJwt(claims)
	if err != nil {
		return nil
	}

	return c.JSON(responder.NewInfoResponse(&registerResponse{
		Token: token,
	}))
}
