package address

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/utils/check"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// AddressPostHandler
// @ID           address.post
// @Summary      Add an address
// @Description  Add am address
// @Tags         me_address
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

	// * Validate Body
	if err := check.Validator.Struct(body); err != nil {
		return &responder.GenericError{
			Message: "Validate body failed",
			Err:     err,
		}
	}

	var addressLine2 *string
	if body.AddressLine2 != nil {
		addressLine2 = body.AddressLine2
	} else {
		addressLine2 = nil
	}

	address := &models.Address{
		Name:         body.Name,
		Phone:        body.Phone,
		AddressLine1: body.AddressLine1,
		AddressLine2: addressLine2,
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

	// * Update user address
	if result := database.Gorm.Model(new(models.User)).Where("id = ?", claims.UserId).Update("address_id", address.Id); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to update user address",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Add the address successfully"))
}
