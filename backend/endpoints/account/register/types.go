package register

type request struct {
	Firstname       *string `json:"firstname" validate:"required"`
	Lastname        *string `json:"lastname" validate:"required"`
	Email           *string `json:"email" validate:"required,email,max=255"`
	Password        *string `json:"password" validate:"required,gte=8"`
	ConfirmPassword *string `json:"confirm_password"`
}

type response struct {
	Token string `json:"token"`
}
