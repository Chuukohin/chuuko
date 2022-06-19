package fiber

import (
	"chuukohin/endpoints"
	"chuukohin/frameworks/fiber/middlewares"
	"chuukohin/frameworks/swagger"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"gorm.io/gorm"
	"log"
	"time"
)

var app *fiber.App

func Init(db *gorm.DB) {
	app = fiber.New(fiber.Config{
		CaseSensitive: true,
		AppName:       "Chuukohin API",
		ErrorHandler:  errorHandler,
		ReadTimeout:   10 * time.Second,
		WriteTimeout:  10 * time.Second,
		StrictRouting: true,
	})

	app.All("/", func(c *fiber.Ctx) error {
		return c.JSON(responder.InfoResponse{
			Success: true,
			Info:    "Chuukohin API Root",
			Data:    nil,
		})
	})

	//Register API endpoints
	apiGroup := app.Group("api/")

	//Swagger endpoint
	swaggerGroup := app.Group("/swagger")
	swagger.Init(swaggerGroup)

	apiGroup.Use(middlewares.Cors())

	// * Register static server
	app.Static("static/", "./static")

	endpoints.Router(apiGroup, db)

	app.Use(notFound)

	err := app.Listen(":8080")
	if err != nil {
		log.Fatal(err.Error())
	}
}
