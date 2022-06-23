package order_status

import (
	"chuukohin/database"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// OrderStatusToReceiveHandler
// @ID           me.order_status.toreceive.get
// @Summary      Get all products that are receiving
// @Description  Get all products that are receiving
// @Tags         me_order_status
// @Accept       json
// @Produce      json
// @Success      200  {object}  []order_status.orderStatusToReceive
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /me/order_status/to_receive [get]
func OrderStatusToReceiveHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Fetch orders
	var orders []*orderStatusToReceive
	if result := database.Gorm.Raw("SELECT od.id, od.order_time, p.name product_name, p.price price, pic.picture_url product_picture "+
		"FROM orders od "+
		"INNER JOIN order_details odt on od.id = odt.order_id "+
		"INNER JOIN products p on od.product_id = p.id "+
		"INNER JOIN pictures pic on p.picture_id = pic.id "+
		"WHERE od.user_id = ? "+
		"AND odt.received = 'false'", claims.UserId).Scan(&orders); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to fetch orders",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse(&orders))
}
