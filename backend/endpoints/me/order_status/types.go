package order_status

import "time"

type orderStatusToReceive struct {
	OrderId        *uint64    `json:"order_id"`
	OrderTime      *time.Time `json:"order_time"`
	ProductName    *string    `json:"product_name"`
	ProductPicture *string    `json:"product_picture"`
	Price          *uint64    `json:"price"`
}
