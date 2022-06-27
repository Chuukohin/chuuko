package home

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
)

// HomeAllProductsGetHandler
// @ID           home.product.get
// @Summary      Home
// @Description  Home
// @Tags         home
// @Accept       json
// @Produce      json
// @Success      200  {object}  []product
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /home/all [get]
func HomeAllProductsGetHandler(c *fiber.Ctx) error {
	var products []*models.Product
	var productsResponse []*product
	if result := database.Gorm.Preload("Picture").Find(&products); result.Error != nil {
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
