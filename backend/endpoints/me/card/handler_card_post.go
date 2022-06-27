package card

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/utils/check"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// CardPostHandler
// @ID           me.card.post
// @Summary      Add a card
// @Description  Add a card
// @Tags         me_card
// @Accept       json
// @Produce      json
// @Param        payload  body      cardPostRequest  true  "card.cardPostRequest"
// @Success      200      {object}  responder.InfoResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /me/card/add [post]
func CardPostHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Parse Body
	body := new(cardPostRequest)
	if err := c.BodyParser(&body); err != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	// * Check duplicate card
	if result := database.Gorm.First(new(models.Card), "user_id = ?", claims.UserId); result.RowsAffected != 0 {
		return &responder.GenericError{
			Message: "You already have a card",
			Err:     result.Error,
		}
	}

	// * Validate Body
	if err := check.Validator.Struct(body); err != nil {
		return &responder.GenericError{
			Message: "Validate body failed",
			Err:     err,
		}
	}

	card := models.Card{
		UserId:      claims.UserId,
		Name:        body.Name,
		CardNo:      body.CardNo,
		MonthExpire: body.MonthExpire,
		YearExpire:  body.YearExpire,
	}

	// * Create a card record
	if result := database.Gorm.Create(&card); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to create a card record",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Added a card successfully"))
}
