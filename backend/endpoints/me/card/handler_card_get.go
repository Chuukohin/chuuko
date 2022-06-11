package card

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/types/response_models"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// CardGetHandler
// @ID           me.card.get
// @Summary      Get user's card
// @Description  Get user's card
// @Tags         me_card
// @Accept       json
// @Produce      json
// @Success      200  {object}  response_models.Card
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /me/card/info [get]
func CardGetHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Get card data
	var card *models.Card
	if result := database.Gorm.First(&card, "user_id = ?", claims.UserId); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to fetch the card",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse(&response_models.Card{
		Name:        card.Name,
		CardNo:      card.CardNo,
		MonthExpire: card.MonthExpire,
		YearExpire:  card.YearExpire,
	}))
}
