package order

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/enum"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/utils/check"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
	"strconv"
)

// OrderCreatePostHandler
// @ID           order.create.post
// @Summary      Create order
// @Description  Create order
// @Tags         order
// @Accept       json
// @Produce      json
// @Success      200  {object}  responder.InfoResponse
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /order/create [post]
func OrderCreatePostHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Parse Body
	body := new(orderCreate)
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

	// * Fetch product
	var productDetail *models.Product
	if result := database.Gorm.First(&productDetail, "id = ?", body.ProductId); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to fetch the product",
			Err:     result.Error,
		}
	}

	// * Check the product is selling or sold
	if *productDetail.Status == "sold" {
		return &responder.GenericError{
			Message: "This product has sold",
		}
	}

	// * Create order
	order := &models.Order{
		UserId:    claims.UserId,
		Price:     productDetail.Price,
		ProductId: body.ProductId,
	}

	if result := database.Gorm.Create(&order); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to create order",
			Err:     result.Error,
		}
	}

	// * Change product status
	if result := database.Gorm.First(&productDetail).Update("status", enum.Sold); result.Error != nil {
		if deleteProduct := database.Gorm.Delete(&order); deleteProduct.Error != nil {
			return &responder.GenericError{
				Message: "Unable to delete product",
				Err:     result.Error,
			}
		}
		return &responder.GenericError{
			Message: "Unable to update product status",
			Err:     result.Error,
		}
	}

	// * Generate order_id
	trackingId := ""
	orderId := strconv.FormatUint(*order.Id, 10)
	for i := 10; i > len(orderId); i-- {
		trackingId += "0"
	}
	trackingId = "ch" + trackingId + orderId

	//productStatus := "Request has sent"
	//now := order.OrderTime.UTC().Format("2006-01-02 15:04:05.0000000 +0000")
	//nowTime, _ := time.Parse("2006-01-02 15:04:05.0000000 +0000", now)

	// * Create order detail
	orderDetail := &models.OrderDetail{
		OrderId:    order.Id,
		TrackingNo: &trackingId,
		//Details: &model_shop.OrderDetail{
		//	ProductId:      body.ProductId,
		//	TrackingNumber: &trackingId,
		//	Status: []*model_shop.DeliveryDetail{
		//		{
		//			Status:      &productStatus,
		//			Description: nil,
		//			Time:        &nowTime,
		//		},
		//	},
		//},
	}

	if result := database.Gorm.Create(&orderDetail); result.Error != nil {
		if deleteProduct := database.Gorm.Delete(&order); deleteProduct.Error != nil {
			return &responder.GenericError{
				Message: "Unable to delete product",
				Err:     result.Error,
			}
		}
		return &responder.GenericError{
			Message: "Unable to create order detail",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Create order successfully"))
}
