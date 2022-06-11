package response_models

import "time"

type Shop struct {
	Id              *uint64    `json:"id"`
	UserId          *uint64    `json:"user_id"`
	User            *User      `json:"user"`
	AddressId       *uint64    `json:"address_id"`
	Address         *Address   `json:"address"`
	ShopName        *string    `json:"shop_name"`
	ShopDescription *string    `json:"shop_description"`
	Firstname       *string    `json:"firstname"`
	Lastname        *string    `json:"lastname"`
	Phone           *string    `json:"phone"`
	PictureId       *uint64    `json:"picture_id"`
	Picture         *Picture   `json:"picture"`
	JoinDate        *time.Time `json:"join_date"`
}
