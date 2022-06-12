package admin

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/responder"
	"chuukohin/utils/check"
	"chuukohin/utils/config"
	"encoding/json"
	"github.com/gofiber/fiber/v2"
	"io/ioutil"
	"os"
	"strconv"
)

// AdminAddMockProductPostHandler
// @ID           admin.mock.product.post
// @Summary      Add mock products
// @Description  Add mock products
// @Tags         admin
// @Accept       json
// @Produce      json
// @Param        payload  body      adminRequest  true  "admin.adminRequest"
// @Success      200      {object}  responder.InfoResponse
// @Failure      400      {object}  responder.ErrorResponse
// @Router       /admin/product/mock/add [post]
func AdminAddMockProductPostHandler(c *fiber.Ctx) error {
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

	var pictureId uint64
	var productId uint64

	for _, fileName := range ProductFiles {
		// * Open jsonFile
		jsonFile, err := os.Open("./data/mock_products/" + fileName.FileName)
		if err != nil {
			return &responder.GenericError{
				Message: "Cannot open JSON file",
				Err:     err,
			}
		}

		// * read our opened jsonFile as a byte array.
		byteValue, _ := ioutil.ReadAll(jsonFile)

		var products []*MockProduct

		// we unmarshal our byteArray which contains our
		// jsonFile's content into 'categories' which we defined above
		json.Unmarshal(byteValue, &products)

		for _, data := range products {
			picture := &models.Picture{
				PictureUrl: data.PictureLink,
			}

			// * Add product's picture
			if result := database.Gorm.Create(&picture); result.Error != nil {
				return &responder.GenericError{
					Message: "Unable to add product's picture",
					Err:     result.Error,
				}
			}

			pictureId = *picture.Id

			selling := "selling"
			product := &models.Product{
				Name:        data.Name,
				Description: data.Description,
				Brand:       data.Brand,
				Price:       data.Price,
				SellerId:    data.SellerId,
				CategoryId:  data.CategoryId,
				PictureId:   picture.Id,
				Status:      &selling,
			}

			// * Add products
			if result := database.Gorm.Create(&product); result.Error != nil {
				return &responder.GenericError{
					Message: "Unable to add products",
					Err:     result.Error,
				}
			}
			productId = *product.Id
		}
	}

	if result := database.Gorm.Raw("ALTER SEQUENCE products_id_seq RESTART WITH " + strconv.FormatUint(productId+1, 10)).Row(); result.Err() != nil {
		return &responder.GenericError{
			Message: "Unable set the sequence of product's AUTO_INCREMENT",
			Err:     result.Err(),
		}
	}

	if result := database.Gorm.Raw("ALTER SEQUENCE pictures_id_seq RESTART WITH " + strconv.FormatUint(pictureId+1, 10)).Row(); result.Err() != nil {
		return &responder.GenericError{
			Message: "Unable set the sequence of picture's AUTO_INCREMENT",
			Err:     result.Err(),
		}
	}

	return c.JSON(responder.NewInfoResponse("Added mock products successfully"))
}
