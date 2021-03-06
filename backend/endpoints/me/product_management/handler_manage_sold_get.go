package product_management

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/enum"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// ProductManagementSoldGetHandler
// @ID           me.product_management.sold.get
// @Summary      Get all sold products in that shop
// @Description  Get all sold products in that shop
// @Tags         me_product_management
// @Accept       json
// @Produce      json
// @Success      200  {object}  []product_management.product
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /me/management/sold [get]
func ProductManagementSoldGetHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	var products []*models.Product
	var productsData []*product

	// * Search products that are selling
	if result := database.Gorm.Preload("Picture").Find(&products, "seller_id = ? AND status = ?", claims.SellerId, enum.Sold); result.RowsAffected != 0 {
		for _, productMap := range products {
			tempProduct := &product{
				Id:         productMap.Id,
				Name:       productMap.Name,
				Brand:      productMap.Brand,
				Price:      productMap.Price,
				PictureUrl: productMap.Picture.PictureUrl,
			}
			productsData = append(productsData, tempProduct)
		}
	} else {
		return &responder.GenericError{
			Message: "This shop has no sold product",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse(productsData))
}
