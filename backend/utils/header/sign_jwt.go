package header

import (
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/responder"
	"chuukohin/utils/config"
	"github.com/golang-jwt/jwt/v4"
)

func SignJwt(claims *jwt_claim.UserClaim) (string, *responder.GenericError) {

	// Create token
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)

	// Generate encoded token and send it as response.
	t, err := token.SignedString([]byte(config.C.JwtSecret))
	if err != nil {
		return t, &responder.GenericError{
			Message: "Unable to generate token",
			Err:     err,
		}
	}

	return t, nil
}
