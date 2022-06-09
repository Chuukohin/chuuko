package seller

type sellerRegisterRequest struct {
	ShopName        string `json:"shop_name"`
	ShopDescription string `json:"shop_description"`
	Firstname       string `json:"firstname"`
	Lastname        string `json:"lastname"`
	Phone           string `json:"phone"`
	AddressLine     string `json:"address_line"`
	Province        string `json:"province"`
	District        string `json:"district"`
	SubDistrict     string `json:"sub_district"`
	PostalCode      string `json:"postal_code"`
}

type sellerBankRequest struct {
	BankName  string `json:"bank_name" validate:"required"`
	AccountNo string `json:"account_no" validate:"required,eq=10"`
}
