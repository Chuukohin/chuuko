package fiber

import (
	"chuukohin/endpoints"
	"chuukohin/frameworks/fiber/middlewares"
	"chuukohin/types/responder"
	"github.com/gofiber/fiber/v2"
	"time"
)

var app *fiber.App

func Init() {
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

	apiGroup.Use(middlewares.Cors())

	endpoints.Router(apiGroup)

	app.Use(notFound)

	err := app.Listen(":8080")
	if err != nil {
		return
	}
}
