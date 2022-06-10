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

// AddressPatchHandler
// @ID           address.patch
// @Summary      Update an address
// @Description  Update am address
// @Tags         me
// @Accept       json
// @Produce      json
// @Param        payload  body      addressPatchRequest  true  "address.addressPatchRequest"
// @Success      200      {object}  responder.InfoResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /me/address/edit [patch]
func AddressPatchHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Parse Body
	body := new(addressPatchRequest)
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

	address := &models.Address{
		Name:         body.Name,
		Phone:        body.Phone,
		AddressLine1: body.AddressLine1,
		AddressLine2: body.AddressLine2,
		Province:     body.Province,
		District:     body.District,
		SubDistrict:  body.SubDistrict,
		PostalCode:   body.PostalCode,
	}

	if result := database.Gorm.Model(new(models.Address)).Where("user_id = ?", claims.UserId).Updates(&address); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to update the address",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Update address successfully"))
}
