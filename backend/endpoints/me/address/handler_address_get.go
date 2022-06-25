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

	// * Find the address
	user := new(models.User)
	user.Address = new(models.Address)
	if result := database.Gorm.Preload("Address").First(&user, "id = ?", claims.UserId); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to find the user",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse(&addressGetResponse{
		Name:         user.Address.Name,
		Phone:        user.Address.Phone,
		AddressLine1: user.Address.AddressLine1,
		AddressLine2: user.Address.AddressLine2,
		Province:     user.Address.Province,
		District:     user.Address.District,
		SubDistrict:  user.Address.SubDistrict,
		PostalCode:   user.Address.PostalCode,
	}))
}
