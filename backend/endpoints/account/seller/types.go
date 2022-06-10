package seller

type sellerRegisterRequest struct {
	ShopName        string `json:"shop_name" validate:"required"`
	ShopDescription string `json:"shop_description" validate:"required"`
	Firstname       string `json:"firstname" validate:"required"`
	Lastname        string `json:"lastname" validate:"required"`
	Phone           string `json:"phone" validate:"required,eq=10"`
	AddressLine1    string `json:"address_line1" validate:"required"`
	AddressLine2    string `json:"address_line2"`
	Province        string `json:"province"  validate:"required"`
	District        string `json:"district"  validate:"required"`
	SubDistrict     string `json:"sub_district"  validate:"required"`
	PostalCode      string `json:"postal_code"  validate:"required"`
	BankName        string `json:"bank_name" validate:"required"`
	AccountNo       string `json:"account_no" validate:"required,eq=10"`
}
