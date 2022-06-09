package address

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// AddressPostHandler
// @ID           address.post
// @Summary      Add an address
// @Description  Add am address
// @Tags         me
// @Accept       json
// @Produce      json
// @Param        payload  body      addressPostRequest  true  "address.addressPostRequest"
// @Success      200      {object}  responder.InfoResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /me/address/add [post]
func AddressPostHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Parse Body
	body := new(addressPostRequest)
	if err := c.BodyParser(&body); err != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	address := &models.Address{
		UserId:       claims.UserId,
		Name:         body.Name,
		Phone:        body.Phone,
		AddressLine1: body.AddressLine1,
		AddressLine2: body.AddressLine2,
		Province:     body.Province,
		District:     body.District,
		SubDistrict:  body.SubDistrict,
		PostalCode:   body.PostalCode,
	}

	// * Add the address
	if result := database.Gorm.Create(&address); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to add the address",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Add the address successfully"))
}
