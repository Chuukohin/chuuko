package income

import (
	"chuukohin/database"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// IncomeGetHandler
// @ID           me.income.get
// @Summary      Seller income
// @Description  Seller income
// @Tags         me_income
// @Accept       json
// @Produce      json
// @Success      200  {object}  income.incomeResponse
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /me/income [get]
func IncomeGetHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	incomeSummaryData := new(incomeSummary)
	var orderListData []*orderList

	if result := database.Gorm.Raw("SELECT s.shop_name shop_name, sum(od.price) total_income "+
		"FROM orders od "+
		"INNER JOIN products p on od.product_id = p.id "+
		"INNER JOIN shops s on p.seller_id = s.id "+
		"WHERE s.id = ? "+
		"GROUP BY s.id", claims.SellerId).Scan(&incomeSummaryData); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to get data",
			Err:     result.Error,
		}
	}

	if result := database.Gorm.Raw("SELECT CONCAT(u.firstname, ' ', u.lastname) customer_name, order_time,od.price income "+
		"FROM orders od "+
		"INNER JOIN users u ON od.user_id = u.id "+
		"INNER JOIN products p on od.product_id = p.id "+
		"INNER JOIN shops s on s.id = p.seller_id "+
		"WHERE s.id = ?", claims.SellerId).Scan(&orderListData); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to get data",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse(&incomeResponse{
		Summary:   incomeSummaryData,
		OrderList: orderListData,
	}))
}
