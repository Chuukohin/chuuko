package response_models

type Card struct {
	Id          *uint64 `json:"id,omitempty"`
	UserId      *uint64 `json:"user_id,omitempty"`
	User        *User   `json:"user,omitempty"`
	Name        *string `json:"name"`
	CardNo      *string `json:"card_no"`
	MonthExpire *string `json:"month_expire"`
	YearExpire  *string `json:"year_expire"`
}
