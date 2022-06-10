package profile

type profilePatchRequest struct {
	Firstname *string `json:"firstname" validate:"required"`
	Lastname  *string `json:"lastname" validate:"required"`
	Email     *string `json:"email" validate:"required,email"`
}
