package product

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// ProductDetailPostHandler
// @ID           product.detail.post
// @Summary      Add a product
// @Description  Add a product
// @Tags         product
// @Accept       json
// @Produce      json
// @Param        payload  body      productDetailRequest  true  "product.productDetailRequest"
// @Success      200      {object}  responder.InfoResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /product/add [post]
func ProductDetailPostHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Parse Body
	body := new(productDetailRequest)
	if err := c.BodyParser(&body); err != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	defaultId := uint64(1)
	selling := "selling"

	product := &models.Product{
		SellerId:    claims.SellerId,
		PictureId:   &defaultId,
		CategoryId:  body.Category,
		Name:        body.Name,
		Description: body.Description,
		Brand:       body.Brand,
		Price:       body.Price,
		Status:      &selling,
	}

	// * Create product
	if result := database.Gorm.Create(&product); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to add the product",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Add product successfully"))
}
