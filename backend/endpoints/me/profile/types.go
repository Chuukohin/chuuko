package profile

import "time"

type profilePatchRequest struct {
	Firstname *string `json:"firstname" validate:"required"`
	Lastname  *string `json:"lastname" validate:"required"`
	Email     *string `json:"email" validate:"required,email"`
}

type profileGetResponse struct {
	Firstname  *string    `json:"firstname"`
	Lastname   *string    `json:"lastname"`
	Email      *string    `json:"email"`
	JoinDate   *time.Time `json:"join_date"`
	PictureUrl *string    `json:"picture_url"`
}
