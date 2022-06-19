package endpoints

import (
	"chuukohin/endpoints/account/login"
	"chuukohin/endpoints/account/register"
	"chuukohin/endpoints/account/seller"
	"chuukohin/endpoints/admin"
	"chuukohin/endpoints/me/address"
	"chuukohin/endpoints/me/card"
	"chuukohin/endpoints/me/my_shop"
	"chuukohin/endpoints/me/password"
	"chuukohin/endpoints/me/product_management"
	"chuukohin/endpoints/me/profile"
	"chuukohin/endpoints/product"
	"chuukohin/frameworks/fiber/middlewares"
	"chuukohin/handler"
	"chuukohin/repository"
	"chuukohin/services"
	"github.com/gofiber/fiber/v2"
	"gorm.io/gorm"
)

func Router(router fiber.Router, db *gorm.DB) {
	userRepository := repository.NewUserRepository(db)
	shopRepository := repository.NewShopRepository(db)
	userService := services.NewUserService(userRepository, shopRepository)
	userHandler := handler.NewUserHandler(userService)

	// * Account 2
	account2 := router.Group("account2/")
	account2.Post("/login", userHandler.Login)
	account2.Post("/register", userHandler.Register)

	// -------------------------------------------------------------------------

	// * Account
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
	adminRouter.Post("/product/mock/add", admin.AdminAddMockProductPostHandler)

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
	meRouter.Get("/card/info", card.CardGetHandler)
	meRouter.Post("/card/edit", card.CardPatchHandler)

	// Me my shop
	meRouter.Get("/myshop/info/:shop_id", my_shop.MyShopGetHandler)

	// Me Product management
	meRouter.Get("/management/selling/", product_management.ProductManagementSellingHandler)
	meRouter.Get("/management/sold/", product_management.ProductManagementSoldHandler)
}
