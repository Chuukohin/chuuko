package middlewares

import (
	"chuukohin/utils/config"
	"github.com/gofiber/fiber/v2"
	cors2 "github.com/gofiber/fiber/v2/middleware/cors"
)

func Cors() fiber.Handler {
	// origins is the value of allowed CORS addresses, separated by comma (,).
	// Example: "https://www.google.com, http://localhost:8080"
	origins := ""
	for i, s := range config.C.Cors {
		origins += s
		if i < len(config.C.Cors)-1 {
			origins += ", "
		}
	}

	cors := cors2.New(cors2.Config{
		AllowOrigins:     origins,
		AllowCredentials: true,
	})

	return cors
}
