package card

type cardPostRequest struct {
	Name        *string `json:"name" validate:"required"`
	CardNo      *string `json:"card_no" validate:"required,len=16"`
	MonthExpire *string `json:"month_expire" validate:"required,len=2"`
	YearExpire  *string `json:"year_expire" validate:"required,len=4"`
}
