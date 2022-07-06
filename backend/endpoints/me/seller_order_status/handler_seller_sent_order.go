package seller_order_status

import (
	"chuukohin/database"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// MeSellerSentOrder
// @ID           me.seller_order_status.sent.get
// @Summary      Sent orders
// @Description  Sent orders
// @Tags         me_seller_order_status
// @Accept       json
// @Produce      json
// @Success      200  {object}  []sellerSendingOrderResponse
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /me/seller_order/status/sent [get]
func MeSellerSentOrder(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	var sellerSendingOrders []*sellerSendingOrderResponse

	if result := database.Gorm.Raw("SELECT concat(u.firstname, ' ', u.lastname) customer_name, "+
		"od.id order_id, od.order_time, "+
		"pic.picture_url product_picture "+
		"FROM orders od "+
		"INNER JOIN users u on u.id = od.user_id "+
		"INNER JOIN products p on od.product_id = p.id "+
		"INNER JOIN pictures pic on pic.id = p.picture_id "+
		"INNER JOIN order_details o on od.id = o.order_id "+
		"WHERE p.seller_id = ? "+
		"AND p.status = 'sold' "+
		"AND o.status = 'Success'", claims.SellerId).Scan(&sellerSendingOrders); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to get seller orders status",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse(&sellerSendingOrders))
}
