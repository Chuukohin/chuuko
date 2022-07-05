package order

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
	"strconv"
)

// OrderUserDetailGetHandler
// @ID           order.user_detail.get
// @Summary      Get user information before create order
// @Description  Get user information before create order
// @Tags         order
// @Accept       json
// @Produce      json
// @Success      200  {object}  order.orderUserDetailResponse
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /order/info/{product_id} [get]
func OrderUserDetailGetHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Query
	productId, _ := strconv.ParseUint(c.Params("product_id"), 10, 64)

	// * Fetch card detail
	var cardDetail *models.Card
	if result := database.Gorm.First(&cardDetail, "user_id = ?", claims.UserId); cardDetail == nil {
		return &responder.GenericError{
			Message: "Please add your credit/debit card to pay",
			Err:     result.Error,
		}
	}

	// * Find address_id in user
	var user *models.User
	if result := database.Gorm.Preload("Address").First(&user, "id = ?", claims.UserId); user.AddressId == nil {
		return &responder.GenericError{
			Message: "Please add your address",
			Err:     result.Error,
		}
	}

	// * Fetch the product
	var productDetail *models.Product
	if result := database.Gorm.Preload("Picture").First(&productDetail, "id = ?", &productId); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to find the product",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse(&orderUserDetailResponse{
		Address: &address{
			Id:           user.Address.Id,
			Name:         user.Address.Name,
			Phone:        user.Address.Phone,
			AddressLine1: user.Address.AddressLine1,
			AddressLine2: user.Address.AddressLine2,
			Province:     user.Address.Province,
			District:     user.Address.District,
			SubDistrict:  user.Address.SubDistrict,
			PostalCode:   user.Address.PostalCode,
		},
		Card: &card{
			Id:          cardDetail.Id,
			Name:        cardDetail.Name,
			CardNo:      cardDetail.CardNo,
			MonthExpire: cardDetail.MonthExpire,
			YearExpire:  cardDetail.YearExpire,
		},
		Product: &product{
			Id:         productDetail.Id,
			Name:       productDetail.Name,
			Price:      productDetail.Price,
			Brand:      productDetail.Brand,
			PictureUrl: productDetail.Picture.PictureUrl,
		},
	}))
}
