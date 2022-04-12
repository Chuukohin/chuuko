package register

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/responder"
	"chuukohin/utils/check"
	"chuukohin/utils/config"
	"chuukohin/utils/crypto"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
	"strconv"
)

// PostHandler
// @ID           account.register.post
// @Summary      Register
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

	// * Validate Body
	if err := check.Validator.Struct(body); err != nil {
		return &responder.GenericError{
			Message: "Validate body failed",
			Err:     err,
		}
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

	// * Set Default PictureID
	defaultPictureId, _ := strconv.ParseUint("1", 10, 32)

	user := &models.User{
		Firstname: body.Firstname,
		Lastname:  body.Lastname,
		Password:  &hashedPassword,
		Email:     body.Email,
		PictureId: &defaultPictureId,
	}

	// * Create User
	if result := database.Gorm.Create(&user); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to create user",
			Err:     result.Error,
		}
	}

	// Create the Claims
	claims := jwt.MapClaims{
		"user_id": *user.Id,
	}

	// Create token
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)

	// Generate encoded token and send it as response.
	t, err := token.SignedString([]byte(config.C.JwtSecret))
	if err != nil {
		return &responder.GenericError{
			Message: "Unable to generate token",
			Err:     err,
		}
	}

	return c.JSON(&responder.InfoResponse{
		Success: true,
		Data: &response{
			Token: t,
		},
	})
}
