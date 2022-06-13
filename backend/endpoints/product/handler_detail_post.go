package product

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/enum"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/utils/check"
	"chuukohin/utils/storage"
	"chuukohin/utils/text"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
	"image"
	"image/jpeg"
	"os"
	"path"
	"strconv"
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

	// * Parse body from multipart
	productName := c.FormValue("name")
	productDescription := c.FormValue("description")
	productBrand := c.FormValue("brand")
	price, _ := strconv.ParseUint(c.FormValue("price"), 10, 64)
	productPrice := price
	categoryId, _ := strconv.ParseUint(c.FormValue("category_id"), 10, 64)
	productCategory := categoryId

	body := &productDetailRequest{
		Name:        &productName,
		Description: &productDescription,
		Brand:       &productBrand,
		Price:       &productPrice,
		CategoryId:  &productCategory,
	}

	// * Validate Body
	if err := check.Validator.Struct(body); err != nil {
		return &responder.GenericError{
			Message: "Validate body failed",
			Err:     err,
		}
	}

	selling := enum.Selling

	product := &models.Product{
		SellerId:    claims.SellerId,
		Name:        body.Name,
		Description: body.Description,
		Brand:       body.Brand,
		Price:       body.Price,
		CategoryId:  body.CategoryId,
		Status:      (*string)(&selling),
	}

	// * Create product
	if result := database.Gorm.Create(&product); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to add the product",
			Err:     result.Error,
		}
	}

	// * Parse multipart file parameter
	fileHeader, err := c.FormFile("image")
	if err != nil {
		if err := deleteProduct(product.Id); err != nil {
			return err
		}
		return &responder.GenericError{
			Message: "Unable to parse image file",
			Err:     err,
		}
	}

	// * Open multipart to file
	file, err := fileHeader.Open()
	if err != nil {
		if err := deleteProduct(product.Id); err != nil {
			return err
		}
		return &responder.GenericError{
			Message: "Unable to parse image file",
			Err:     err,
		}
	}

	// * Decode image
	img, _, err := image.Decode(file)
	if err != nil {
		if err := deleteProduct(product.Id); err != nil {
			return err
		}
		return &responder.GenericError{
			Message: "Unable to decode image",
			Err:     err,
		}
	}

	// * Assign file path
	filePath := path.Join(storage.ProductsDir, strconv.FormatUint(*product.Id, 10))
	fileSalt := *text.GenerateString(text.GenerateStringSet.Num, 6)

	// * Save image to file
	savingFile, err := os.Create(filePath + "." + fileSalt + ".jpeg")
	if err != nil {
		if err := deleteProduct(product.Id); err != nil {
			return err
		}
		return &responder.GenericError{
			Message: "Unable to create an image file",
			Err:     err,
		}
	}
	defer savingFile.Close()

	if err := jpeg.Encode(savingFile, img, nil); err != nil {
		if err := deleteProduct(product.Id); err != nil {
			return err
		}
		return &responder.GenericError{
			Message: "Unable to save an image file",
			Err:     err,
		}
	}

	// * Create shop_pic
	location := "/static/products/" + strconv.FormatUint(*product.Id, 10) + "." + fileSalt + ".jpeg"
	productLocation := location
	productPicture := &models.Picture{
		PictureUrl: &productLocation,
	}

	// * Add an image's location to database
	if result := database.Gorm.Create(&productPicture); result.Error != nil {
		if err := deleteProduct(product.Id); err != nil {
			return err
		}
		return &responder.GenericError{
			Message: "Unable to add product picture",
			Err:     result.Error,
		}
	}

	product.PictureId = productPicture.Id

	// * Update an image to product
	if result := database.Gorm.Updates(&product); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to update an image to the product",
			Err:     result.Error,
		}
	}

	return c.JSON(responder.NewInfoResponse("Add product successfully"))
}

func deleteProduct(id *uint64) error {
	if result := database.Gorm.Delete(&models.Product{}, id); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to delete the product",
			Err:     result.Error,
		}
	}
	return nil
}
