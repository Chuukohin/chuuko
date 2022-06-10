package register

type registerRequest struct {
	Firstname       *string `json:"firstname" validate:"required"`
	Lastname        *string `json:"lastname" validate:"required"`
	Email           *string `json:"email" validate:"required,email,max=255"`
	Password        *string `json:"password"`
	ConfirmPassword *string `json:"confirm_password"`
}

type registerResponse struct {
	Token string `json:"token"`
}
