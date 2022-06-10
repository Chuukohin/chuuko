package address

type addressPostRequest struct {
	Name         *string `json:"name" validate:"required"`
	Phone        *string `json:"phone" validate:"required"`
	AddressLine1 *string `json:"address_line_1" validate:"required"`
	AddressLine2 *string `json:"address_line_2" `
	Province     *string `json:"province" validate:"required"`
	District     *string `json:"district" validate:"required"`
	SubDistrict  *string `json:"sub_district" validate:"required"`
	PostalCode   *string `json:"postal_code" validate:"required"`
}

type addressPatchRequest struct {
	Name         *string `json:"name" validate:"required"`
	Phone        *string `json:"phone" validate:"required"`
	AddressLine1 *string `json:"address_line_1" validate:"required"`
	AddressLine2 *string `json:"address_line_2"`
	Province     *string `json:"province" validate:"required"`
	District     *string `json:"district" validate:"required"`
	SubDistrict  *string `json:"sub_district" validate:"required"`
	PostalCode   *string `json:"postal_code" validate:"required"`
}
