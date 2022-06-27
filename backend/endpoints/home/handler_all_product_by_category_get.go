package home

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
)

// HomeProductsByCategoryGetHandler
// @ID           home.product.by_category.get
// @Summary      Get products by category
// @Description  Get products by category
// @Tags         home
// @Accept       json
// @Produce      json
// @Success      200  {object}  []product
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /home/category/{category_id} [get]
func HomeProductsByCategoryGetHandler(c *fiber.Ctx) error {
	var products []*models.Product
	var productsResponse []*product
	if result := database.Gorm.Preload("Picture").Find(&products, "category_id = ?", c.Params("category_id", "11")); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to find products",
			Err:     result.Error,
		}
	} else {
		for _, data := range products {
			tempProduct := &product{
				Id:         data.Id,
				Name:       data.Name,
				Price:      data.Price,
				Brand:      data.Brand,
				PictureUrl: data.Picture.PictureUrl,
			}
			productsResponse = append(productsResponse, tempProduct)
		}
	}
	return c.JSON(responder.NewInfoResponse(&productsResponse))
}
