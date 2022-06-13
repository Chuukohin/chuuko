package login

type loginRequest struct {
	Email    *string `json:"email" validate:"required,email"`
	Password *string `json:"password" validate:"required"`
}

type loginResponse struct {
	Token string `json:"token"`
}
