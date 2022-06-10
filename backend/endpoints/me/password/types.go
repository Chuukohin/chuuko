package password

type passwordPatchRequest struct {
	CurrentPassword *string `json:"current_password" validate:"required"`
	NewPassword     string  `json:"new_password" validate:"required,min=8,max=255"`
}
