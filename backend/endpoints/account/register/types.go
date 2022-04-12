package register

type request struct {
	Firstname       *string `json:"firstname"`
	Lastname        *string `json:"lastname"`
	Email           *string `json:"email"`
	Password        *string `json:"password"`
	ConfirmPassword *string `json:"confirm_password"`
}

type response struct {
	Token string `json:"token"`
}
