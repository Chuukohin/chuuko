package product

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/responder"
	"chuukohin/types/response_models"
	"github.com/gofiber/fiber/v2"
	"strconv"
)

// ProductDetailGetHandler
// @ID           product.detail.get
// @Summary      Get product detail
// @Description  Get product detail
// @Tags         product
// @Accept       json
// @Produce      json
// @Success      200  {object}  response_models.Product
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /product/info/{product_id} [get]
func ProductDetailGetHandler(c *fiber.Ctx) error {
	// * Get value from params
	productId, _ := strconv.ParseUint(c.Params("product_id"), 10, 64)

	// * Fetch all details
	var product *models.Product
	if result := database.Gorm.Preload("Category").Preload("Picture").First(&product, "id = ?", productId); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to fetch the product",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse(&response_models.Product{
		Id:          product.Id,
		Name:        product.Name,
		Description: product.Description,
		Brand:       product.Brand,
		Price:       product.Price,
		Category: &response_models.Category{
			Id:   product.Category.Id,
			Name: product.Category.Name,
		},
		Picture: &response_models.Picture{
			Id:         product.Picture.Id,
			PictureUrl: product.Picture.PictureUrl,
		},
		SellerId: product.SellerId,
		Status:   product.Status,
	}))
}
