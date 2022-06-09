package seller

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// SellerBankPostHandler
// @ID           seller.bank.post
// @Summary      Create bank account
// @Description  Create bank account
// @Tags         account
// @Accept       json
// @Produce      json
// @Param        payload  body      sellerBankRequest  true  "seller.sellerBankRequest"
// @Success      200      {object}  responder.InfoResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /account/seller/bank [post]
func SellerBankPostHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Parse Body
	body := new(sellerBankRequest)
	if err := c.BodyParser(&body); err != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	bank := &models.BankAccount{
		SellerId:  claims.SellerId,
		BankName:  &body.BankName,
		AccountNo: &body.AccountNo,
	}

	// * Create bank account
	if result := database.Gorm.Create(&bank); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Created bank account successfully"))
}
