package income

import "time"

type incomeResponse struct {
	Summary   *incomeSummary `json:"summary"`
	OrderList []*orderList   `json:"order_list"`
}

type incomeSummary struct {
	ShopName    *string `json:"shop_name"`
	TotalIncome *uint64 `json:"total_income"`
}

type orderList struct {
	CustomerName *string    `json:"customer_name"`
	OrderTime    *time.Time `json:"order_time"`
	Income       *uint64    `json:"income"`
}
