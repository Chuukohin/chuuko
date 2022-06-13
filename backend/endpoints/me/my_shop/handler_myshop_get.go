package my_shop

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
)

// MyShopGetHandler
// @ID           me.myshop.get
// @Summary      Get shop data and products by id
// @Description  Get shop data and products by id
// @Tags         me_myshop
// @Accept       json
// @Produce      json
// @Success      200  {object}  my_shop.myShopGetResponse
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /me/myshop/info/{shop_id} [get]
func MyShopGetHandler(c *fiber.Ctx) error {
	// * Get param
	shopId := c.Params("shop_id")

	shopDetail := new(myShopGetResponse)
	shopDetail.Seller = new(sellerData)

	// * Search shop's information
	var shop *models.Shop
	if result := database.Gorm.First(&shop, "id = ?", shopId); result.RowsAffected != 0 {
		shopDetail.Seller.JoinDate = shop.JoinDate
		shopDetail.Seller.Name = shop.ShopName
	}

	// * Search products in this shop
	var products []*models.Product
	var productsData []*product
	if result := database.Gorm.Preload("Picture").Find(&products, "seller_id = ?", shopId); result.RowsAffected != 0 {
		for _, productMap := range products {
			tempProduct := &product{
				Id:         productMap.Id,
				Name:       productMap.Name,
				Price:      productMap.Price,
				Brand:      productMap.Brand,
				PictureUrl: productMap.Picture.PictureUrl,
			}
			productsData = append(productsData, tempProduct)
		}
		shopDetail.Products = productsData
		count := uint64(len(products))
		shopDetail.Seller.TotalProduct = &count
	}

	return c.JSON(responder.NewInfoResponse(shopDetail))
}
