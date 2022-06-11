package response_models

type Address struct {
	Id           *uint64 `json:"id"`
	UserId       *uint64 `json:"user_id"`
	User         *User   `json:"user"`
	Name         *string `json:"name"`
	Phone        *string `json:"phone"`
	AddressLine1 *string `json:"address_line_1"`
	AddressLine2 *string `json:"address_line_2"`
	Province     *string `json:"province"`
	District     *string `json:"district"`
	SubDistrict  *string `json:"sub_district"`
	PostalCode   *string `json:"postal_code"`
}
