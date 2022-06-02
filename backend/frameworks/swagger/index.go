package swagger

import (
	swagger "github.com/arsmn/fiber-swagger/v2"
	"github.com/gofiber/fiber/v2"
)

// @title Chuukohin API
// @version 1.0
// @description The Swagger API for Chuukohin Backend module.

// @contact.name API Support
// @contact.url http://www.swagger.io/support
// @contact.email support@swagger.io

// @license.name Apache 2.0
// @license.url http://www.apache.org/licenses/LICENSE-2.0.html

// @host      localhost:8080
// @BasePath  /api
func Init(router fiber.Router) {
	router.Get("*", swagger.HandlerDefault)
}
