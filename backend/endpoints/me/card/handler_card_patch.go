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

// CardPatchHandler
// @ID           me.card.patch
// @Summary      Edit a card
// @Description  Edit a card
// @Tags         me_card
// @Accept       json
// @Produce      json
// @Param        payload  body      cardPostRequest  true  "card.cardPostRequest"
// @Success      200      {object}  responder.InfoResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /me/card/edit [patch]
func CardPatchHandler(c *fiber.Ctx) error {
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

	// * Validate Body
	if err := check.Validator.Struct(body); err != nil {
		return &responder.GenericError{
			Message: "Validate body failed",
			Err:     err,
		}
	}

	// * Edit a card record
	card := models.Card{
		Name:        body.Name,
		MonthExpire: body.MonthExpire,
		YearExpire:  body.YearExpire,
	}

	if result := database.Gorm.First(new(models.Card), "user_id = ?", claims.UserId).Updates(&card); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to update the card record",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Updated card successfully"))
}
