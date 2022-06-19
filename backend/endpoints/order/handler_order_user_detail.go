package order

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// OrderUserDetailHandler
// @ID           order.user_detail.get
// @Summary      Get user information before create order
// @Description  Get user information before create order
// @Tags         order
// @Accept       json
// @Produce      json
// @Success      200  {object}  order.orderUserDetailResponse
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /order/info [get]
func OrderUserDetailHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Fetch card detail
	var cardDetail *models.Card
	if result := database.Gorm.First(&cardDetail, "user_id = ?", claims.UserId); result.Error != nil {
		return &responder.GenericError{
			Message: "Please add you credit/debit card to pay",
			Err:     result.Error,
		}
	}

	// * Find address_id in user
	var user *models.User
	if result := database.Gorm.First(&user, "id = ?", claims.UserId); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to find the user",
			Err:     result.Error,
		}
	}

	// * Fetch user address
	var addressDetail *models.Address
	if result := database.Gorm.First(&addressDetail, "id = ?", user.AddressId); result.Error != nil {
		return &responder.GenericError{
			Message: "Please add your credit/debit card to pay",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse(&orderUserDetailResponse{
		Address: &address{
			Id:           addressDetail.Id,
			Name:         addressDetail.Name,
			Phone:        addressDetail.Phone,
			AddressLine1: addressDetail.AddressLine1,
			AddressLine2: addressDetail.AddressLine2,
			Province:     addressDetail.Province,
			District:     addressDetail.District,
			SubDistrict:  addressDetail.SubDistrict,
			PostalCode:   addressDetail.PostalCode,
		},
		Card: &card{
			Id:          cardDetail.Id,
			Name:        cardDetail.Name,
			CardNo:      cardDetail.CardNo,
			MonthExpire: cardDetail.MonthExpire,
			YearExpire:  cardDetail.YearExpire,
		},
	}))
}
