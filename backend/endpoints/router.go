package endpoints

import (
	"chuukohin/endpoints/account/login"
	"chuukohin/endpoints/account/register"
	"chuukohin/endpoints/account/seller"
	"chuukohin/endpoints/admin"
	"chuukohin/endpoints/me/address"
	"chuukohin/endpoints/me/card"
	"chuukohin/endpoints/me/password"
	"chuukohin/endpoints/me/profile"
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
	productRouter.Get("/info/:product_id", product.ProductDetailGetHandler)

	// Me
	meRouter := router.Group("/me", middlewares.Jwt)

	// Me Address
	meRouter.Post("/address/add", address.AddressPostHandler)
	meRouter.Patch("/address/edit", address.AddressPatchHandler)
	meRouter.Get("/address/info", address.AddressGetHandler)

	// Me Profile
	meRouter.Patch("/profile/edit", profile.ProfilePatchHandler)
	meRouter.Get("/profile/info", profile.ProfileGetHandler)

	// Me Password
	meRouter.Patch("/password/edit", password.PasswordPatchHandler)

	// Me Card
	meRouter.Post("/card/add", card.CardPostHandler)
}
