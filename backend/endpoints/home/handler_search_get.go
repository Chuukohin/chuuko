package home

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"strconv"
)

// HomeSearchGetHandler
// @ID           home.search.get
// @Summary      Search
// @Description  Search
// @Tags         home
// @Accept       json
// @Produce      json
// @Success      200  {object}  []product
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /home/search [get]
func HomeSearchGetHandler(c *fiber.Ctx) error {
	var products []*models.Product
	var productsResponse []*product
	if result := database.Gorm.Preload("Picture").Find(&products, "name LIKE ?", "%"+c.Query("value")+"%"); result.RowsAffected != 0 {
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
	} else if result.RowsAffected == 0 {
		return &responder.GenericError{
			Message: "Not found",
		}
	}

	var indexes string = "("
	for i, p := range productsResponse {
		tempIndex := strconv.FormatUint(*p.Id, 10)
		indexes += tempIndex + ","
		if i == len(productsResponse)-1 {
			indexes += tempIndex + ")"
		}
	}

	if result := database.Gorm.Preload("Picture").Find(&products, "description LIKE ? AND id NOT IN ?", "%"+c.Query("value")+"%", indexes); result.RowsAffected != 0 {
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
