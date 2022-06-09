package endpoints

import (
	"chuukohin/endpoints/account/login"
	"chuukohin/endpoints/account/register"
	"chuukohin/endpoints/account/seller"
	"chuukohin/endpoints/admin"
	"chuukohin/frameworks/fiber/middlewares"
	"github.com/gofiber/fiber/v2"
)

func Router(router fiber.Router) {
	account := router.Group("account/")
	account.Post("/login", login.PostHandler)
	account.Post("/register", register.PostHandler)
	account.Post("/seller/register", seller.SellerRegisterPostHandler)

	// Seller Account
	sellerAccount := router.Group("account/", middlewares.Jwt)
	sellerAccount.Patch("/seller/picture", seller.SellerPicturePostHandler)

	// Admin
	adminRouter := router.Group("/admin")
	adminRouter.Post("/reset", admin.AdminResetPostHandler)
}
