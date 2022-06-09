package middlewares

import (
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/utils/config"
	"github.com/gofiber/fiber/v2"
	jwtware "github.com/gofiber/jwt/v3"
)

var Jwt = func() fiber.Handler {
	conf := jwtware.Config{
		SigningKey:  []byte(config.C.JwtSecret),
		TokenLookup: "header:Authorization",
		AuthScheme:  "Bearer",
		ContextKey:  "user",
		Claims:      &jwt_claim.UserClaim{},
		ErrorHandler: func(c *fiber.Ctx, err error) error {
			return &responder.GenericError{
				Message: "JWT validation failure",
				Err:     err,
			}
		},
	}

	return jwtware.New(conf)
}()
