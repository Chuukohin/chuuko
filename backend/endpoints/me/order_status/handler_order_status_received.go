package order_status

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/model_shop"
	"chuukohin/types/responder"
	"encoding/json"
	"github.com/gofiber/fiber/v2"
	"time"
)

// OrderStatusReceivedHandler
// @ID           me.order_status.received.patch
// @Summary      Received the product
// @Description  Received the product
// @Tags         me_order_status
// @Accept       json
// @Produce      json
// @Param        payload  body      orderReceivedRequest  true  "order_status.orderReceivedRequest"
// @Success      200      {object}  responder.InfoResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /me/order_status/received [patch]
func OrderStatusReceivedHandler(c *fiber.Ctx) error {
	// * Parse Body
	body := new(orderReceivedRequest)
	if err := c.BodyParser(&body); err != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	var orderDetail *models.OrderDetail

	if result := database.Gorm.First(&orderDetail, "order_id = ?", *body.OrderId); result.Error != nil {
		return &responder.GenericError{
			Message: "eeee",
		}
	}

	// * Convert type
	m := string(*orderDetail.Details)
	orderDetailDetails := new(model_shop.OrderDetail)
	err := json.Unmarshal([]byte(m), orderDetailDetails)
	now := time.Now().UTC().Format("2006-01-02 15:04:05.0000000 +0000")
	nowTime, _ := time.Parse("2006-01-02 15:04:05.0000000 +0000", now)
	if err != nil {
		return &responder.GenericError{
			Message: "Unable to unmarshal json",
			Err:     err,
		}
	}

	success := "Success"
	receivedTrue := true
	received := &model_shop.DeliveryDetail{
		Status:      &success,
		Description: nil,
		Time:        &nowTime,
	}

	var deliveryDetails []*model_shop.DeliveryDetail
	for _, status := range orderDetailDetails.Status {
		deliveryDetails = append(deliveryDetails, status)
	}

	orderDetail.Received = &receivedTrue
	orderDetail.Status = &success
	deliveryDetails = append(deliveryDetails, received)

	details := &model_shop.OrderDetail{
		ProductId:      orderDetailDetails.ProductId,
		TrackingNumber: orderDetailDetails.TrackingNumber,
		Status:         deliveryDetails,
	}

	// * Update order status
	if result := database.Gorm.Model(new(models.OrderDetail)).Where("order_id = ?", *body.OrderId).Update("received", "true").Update("details", details); result.Error != nil {
		return &responder.GenericError{
			Message: "Order not found",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Update order status successfully"))
}
