package seller

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/utils/header"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// SellerRegisterPostHandler
// @ID           seller.register.post
// @Summary      Register a seller
// @Description  Register a seller
// @Tags         account
// @Accept       json
// @Produce      json
// @Param        payload  body      sellerRegisterRequest  true  "seller.sellerRegisterRequest"
// @Success      200      {object}  responder.InfoResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /account/seller/register [post]
func SellerRegisterPostHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Parse Body
	body := new(sellerRegisterRequest)
	if err := c.BodyParser(&body); err != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	address := &models.Address{
		UserId:       claims.UserId,
		Name:         &body.ShopName,
		Phone:        &body.Phone,
		AddressLine1: &body.AddressLine1,
		AddressLine2: &body.AddressLine2,
		Province:     &body.Province,
		District:     &body.District,
		SubDistrict:  &body.SubDistrict,
		PostalCode:   &body.PostalCode,
	}

	if result := database.Gorm.Create(&address); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to create an address",
			Err:     result.Error,
		}
	}

	shop := &models.Shop{
		UserId:          claims.UserId,
		ShopName:        &body.ShopName,
		ShopDescription: &body.ShopDescription,
		AddressId:       address.Id,
		Phone:           &body.Phone,
	}

	// * Create shop
	if result := database.Gorm.Create(&shop); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to create shop",
			Err:     result.Error,
		}
	}

	bank := &models.BankAccount{
		SellerId:  shop.Id,
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

	newClaims := &jwt_claim.UserClaim{
		UserId:   claims.UserId,
		SellerId: shop.Id,
	}

	// * Sign a new JWT
	newToken, err := header.SignJwt(newClaims)
	if err != nil {
		return nil
	}

	return c.JSON(responder.NewInfoResponse(&sellerRegisterResponse{
		NewToken: newToken,
	}))
}
