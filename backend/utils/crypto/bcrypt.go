package crypto

import "golang.org/x/crypto/bcrypt"

func HashPassword(password string) (string, error) {
	var hashedPassword, err = bcrypt.GenerateFromPassword([]byte(password), bcrypt.MaxCost)
	return string(hashedPassword), err
}

func ComparePassword(hashedPassword string, password string) bool {
	if err := bcrypt.CompareHashAndPassword([]byte(hashedPassword), []byte(password)); err != nil {
		return false
	}
	return true
}
