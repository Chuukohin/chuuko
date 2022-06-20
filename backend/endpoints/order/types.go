package order

type orderUserDetailResponse struct {
	Address *address `json:"address"`
	Card    *card    `json:"card"`
	Product *product `json:"product"`
}

type orderCreate struct {
	ProductId *uint64 `json:"product_id" validate:"required"`
}

type address struct {
	Id           *uint64 `json:"id"`
	Name         *string `json:"name"`
	Phone        *string `json:"phone"`
	AddressLine1 *string `json:"address_line_1"`
	AddressLine2 *string `json:"address_line_2"`
	Province     *string `json:"province"`
	District     *string `json:"district"`
	SubDistrict  *string `json:"sub_district"`
	PostalCode   *string `json:"postal_code"`
}

type card struct {
	Id          *uint64 `json:"id"`
	Name        *string `json:"name"`
	CardNo      *string `json:"card_no"`
	MonthExpire *string `json:"month_expire"`
	YearExpire  *string `json:"year_expire"`
}

type product struct {
	Id         *uint64 `json:"id"`
	Name       *string `json:"name"`
	Price      *uint64 `json:"price"`
	Brand      *string `json:"brand"`
	PictureUrl *string `json:"picture_url"`
}
