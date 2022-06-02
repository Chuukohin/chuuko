package check

import "chuukohin/types/responder"

func ValidatePassword(password string) *responder.GenericError {
	// * Validate password pattern
	if len(password) < 8 || len(password) > 255 {
		return &responder.GenericError{
			Code:    "INVALID_INFORMATION",
			Message: "Password length must be between 8 to 255 characters",
		}
	}
	return nil
}
