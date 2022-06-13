package response_models

import "time"

type User struct {
	Id        *uint64    `json:"id"`
	Email     *string    `json:"email"`
	Password  *string    `json:"password"`
	Firstname *string    `json:"firstname"`
	Lastname  *string    `json:"lastname"`
	PictureId *uint64    `json:"picture_id"`
	Picture   *Picture   `json:"picture"`
	JoinDate  *time.Time `json:"join_date"`
}
