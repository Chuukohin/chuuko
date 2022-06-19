package address

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

// AddressGetHandler
// @ID           address.get
// @Summary      Get the address
// @Description  Get the address
// @Tags         me_address
// @Accept       json
// @Produce      json
// @Success      200  {object}  address.addressGetResponse
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /me/address/info [get]
func AddressGetHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Find address_id in user
	var user *models.User
	if result := database.Gorm.First(&user, "id = ?", claims.UserId); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to find the user",
			Err:     result.Error,
		}
	}

	// * Find the address
	var address *models.Address
	if result := database.Gorm.First(&address, "id = ?", user.AddressId); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to find the address",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse(&addressGetResponse{
		Name:         address.Name,
		Phone:        address.Phone,
		AddressLine1: address.AddressLine1,
		AddressLine2: address.AddressLine2,
		Province:     address.Province,
		District:     address.District,
		SubDistrict:  address.SubDistrict,
		PostalCode:   address.PostalCode,
	}))
}
