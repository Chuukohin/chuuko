package order_status

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
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

	// * Update order status
	if result := database.Gorm.Model(new(models.OrderDetail)).Where("order_id = ?", *body.OrderId).Update("received", "true"); result.Error != nil {
		return &responder.GenericError{
			Message: "Order not found",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Update order status successfully"))
}
