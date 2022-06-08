package admin

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/responder"
	"chuukohin/utils/check"
	"chuukohin/utils/config"
	"chuukohin/utils/crypto"
	"github.com/gofiber/fiber/v2"
	"gorm.io/gorm"
)

// AdminResetPostHandler
// @ID           admin.reset.post
// @Summary      Reset all
// @Description  Reset all
// @Tags         admin
// @Accept       json
// @Produce      json
// @Param        payload  body      adminRequest  true  "admin.adminRequest"
// @Success      200      {object}  responder.Info
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /admin/reset [post]
func AdminResetPostHandler(c *fiber.Ctx) error {
	body := new(adminRequest)
	if err := c.BodyParser(&body); err != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	// * Validate body
	if err := check.Validator.Struct(body); err != nil {
		return err
	}

	// * Authorization
	if c.IP() != config.C.InternalIP || body.AdminToken != config.C.AdminToken {
		return &responder.GenericError{
			Message: "Authorization failed",
		}
	}

	//	&models.Picture{},
	//			&models.User{},
	//			&models.Address{},
	//			&models.Seller{},
	//			&models.BankAccount{},
	//			&models.Card{},
	//			&models.Category{},
	//			&models.Product{},
	//			&models.Order{},
	//			&models.OrderDetail{},

	// * Delete all data
	if result := database.Gorm.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&models.OrderDetail{}); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to delete order_detail data",
			Err:     result.Error,
		}
	}

	if result := database.Gorm.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&models.Order{}); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to delete order data",
			Err:     result.Error,
		}
	}

	if result := database.Gorm.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&models.Product{}); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to delete product data",
			Err:     result.Error,
		}
	}

	if result := database.Gorm.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&models.Category{}); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to delete category data",
			Err:     result.Error,
		}
	}

	if result := database.Gorm.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&models.Card{}); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to delete card data",
			Err:     result.Error,
		}
	}

	if result := database.Gorm.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&models.BankAccount{}); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to delete bank_account data",
			Err:     result.Error,
		}
	}

	if result := database.Gorm.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&models.Shop{}); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to delete seller data",
			Err:     result.Error,
		}
	}

	if result := database.Gorm.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&models.Address{}); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to delete address data",
			Err:     result.Error,
		}
	}

	if result := database.Gorm.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&models.User{}); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to delete user data",
			Err:     result.Error,
		}
	}

	if result := database.Gorm.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&models.Picture{}); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to delete picture data",
			Err:     result.Error,
		}
	}

	// * Create default databases
	pic := "https://chuukohin-pic.mixkoap.com/sibbil.png"
	beginningId := uint64(1)
	picture := &models.Picture{
		Id:         &beginningId,
		PictureUrl: &pic,
	}

	if result := database.Gorm.Create(&picture); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to add picture",
			Err:     result.Error,
		}
	}

	firstname := "Kokomi"
	lastname := "Sangonomiya"
	email := "a@b.com"
	hashedPassword, _ := crypto.HashPassword("0820608908")

	user := &models.User{
		Id:        &beginningId,
		Firstname: &firstname,
		Lastname:  &lastname,
		Email:     &email,
		Password:  &hashedPassword,
	}

	if result := database.Gorm.Create(&user); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to create a user",
			Err:     result.Error,
		}
	}

	name := firstname + " " + lastname
	phone := "0820608908"
	addressLine := "23/555 Niran"
	district := "Phra kanong"
	subDistrict := "Bangchak"
	province := "Bangkok"
	postal := "10260"

	address := &models.Address{
		Id:           &beginningId,
		UserId:       &beginningId,
		Name:         &name,
		AddressLine1: &addressLine,
		Phone:        &phone,
		Province:     &province,
		District:     &district,
		SubDistrict:  &subDistrict,
		PostalCode:   &postal,
	}

	if result := database.Gorm.Create(&address); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to create an address",
			Err:     result.Error,
		}
	}

	shopName := "Chuukohin official"
	shopDes := "Just a shop"

	shop := &models.Shop{
		Id:              &beginningId,
		UserId:          &beginningId,
		Firstname:       &firstname,
		Lastname:        &lastname,
		Phone:           &phone,
		PictureId:       &beginningId,
		AddressId:       &beginningId,
		ShopName:        &shopName,
		ShopDescription: &shopDes,
	}

	if result := database.Gorm.Create(&shop); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to create a shop",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Delete all data successful"))
}
