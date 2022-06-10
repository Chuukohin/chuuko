package seller

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/utils/storage"
	"chuukohin/utils/text"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
	"image"
	"image/jpeg"
	_ "image/png"
	"os"
	"path"
	"path/filepath"
	"strconv"
)

// SellerPicturePostHandler
// @ID           seller.picture.patch
// @Summary      Insert & Edit shop image
// @Description  Insert & Edit shop image
// @Tags         account
// @Accept       json
// @Produce      json
// @Success      200  {object}  responder.InfoResponse
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /account/seller/picture [patch]
func SellerPicturePostHandler(c *fiber.Ctx) error {
	// * Parse user JWT token
	token := c.Locals("user").(*jwt.Token)
	claims := token.Claims.(*jwt_claim.UserClaim)

	// * Parse multipart file parameter
	fileHeader, err := c.FormFile("image")
	if err != nil {
		return &responder.GenericError{
			Message: "Unable to parse image file",
			Err:     err,
		}
	}

	// * Open multipart to file
	file, err := fileHeader.Open()
	if err != nil {
		return &responder.GenericError{
			Message: "Unable to parse image file",
			Err:     err,
		}
	}

	// * Decode image
	img, _, err := image.Decode(file)
	if err != nil {
		return &responder.GenericError{
			Message: "Unable to decode image",
			Err:     err,
		}
	}

	// * Assign file path
	filePath := path.Join(storage.ShopsDir, strconv.FormatUint(*claims.SellerId, 10))
	fileSalt := *text.GenerateString(text.GenerateStringSet.Num, 6)

	// * Check for existing avatar image for the shop image
	matches, err := filepath.Glob(filePath + ".*")
	if err != nil {
		return &responder.GenericError{
			Message: "Unable to check for file existent",
			Err:     err,
		}
	}

	// * Remove old user avatar
	for _, match := range matches {
		if err = os.Remove(match); err != nil {
			return &responder.GenericError{
				Message: "Unable to remove old avatar",
				Err:     err,
			}
		}
	}

	// * Save image to file
	savingFile, err := os.Create(filePath + "." + fileSalt + ".jpeg")
	if err != nil {
		return &responder.GenericError{
			Message: "Unable to create an image file",
			Err:     err,
		}
	}
	defer savingFile.Close()

	if err := jpeg.Encode(savingFile, img, nil); err != nil {
		return &responder.GenericError{
			Message: "Unable to save an image file",
			Err:     err,
		}
	}

	// * Create shop_pic
	location := "/static/shops/" + strconv.FormatUint(*claims.SellerId, 10) + "." + fileSalt + ".jpeg"
	pictureLocation := location
	shopPicture := &models.Picture{
		PictureUrl: &pictureLocation,
	}

	if result := database.Gorm.Create(&shopPicture); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to insert the image",
			Err:     result.Error,
		}
	}

	// * Update shop's picture
	if result := database.Gorm.First(&models.Shop{}, "id = ?", claims.SellerId).Update("picture_id", shopPicture.Id); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to update shop's picture",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Added shop's picture successfully"))
}
