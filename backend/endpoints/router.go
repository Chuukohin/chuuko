package endpoints

import (
	"chuukohin/endpoints/account/login"
	"chuukohin/endpoints/account/register"
	"chuukohin/endpoints/account/seller"
	"chuukohin/endpoints/admin"
	"chuukohin/endpoints/me/address"
	"chuukohin/endpoints/product"
	"chuukohin/frameworks/fiber/middlewares"
	"github.com/gofiber/fiber/v2"
)

func Router(router fiber.Router) {
	account := router.Group("account/")
	account.Post("/login", login.PostHandler)
	account.Post("/register", register.PostHandler)

	// Seller Account
	sellerAccount := router.Group("account/", middlewares.Jwt)
	sellerAccount.Patch("/seller/picture", seller.SellerPicturePostHandler)
	sellerAccount.Post("/seller/register", seller.SellerRegisterPostHandler)

	// Admin
	adminRouter := router.Group("/admin")
	adminRouter.Post("/reset", admin.AdminResetPostHandler)

	// Product
	productRouter := router.Group("/product", middlewares.Jwt)
	productRouter.Post("/add", product.ProductDetailPostHandler)

	// Me
	meRouter := router.Group("/me", middlewares.Jwt)
	meRouter.Post("/address/add", address.AddressPostHandler)
	meRouter.Patch("/address/edit", address.AddressPatchHandler)
}
