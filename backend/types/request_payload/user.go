package request_payload

// * Login

type LoginResponse struct {
	Token string `json:"token"`
}

type LoginRequest struct {
	Email    *string `json:"email" validate:"required,email"`
	Password *string `json:"password" validate:"required"`
}

// * Register

type RegisterRequest struct {
	Firstname       *string `json:"firstname" validate:"required"`
	Lastname        *string `json:"lastname" validate:"required"`
	Email           *string `json:"email" validate:"required,email,max=255"`
	Password        *string `json:"password" validate:"required"`
	ConfirmPassword *string `json:"confirm_password" validate:"required"`
}

type RegisterResponse struct {
	Token string `json:"token"`
}
