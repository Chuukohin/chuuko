package seller_order_status

import "time"

type sellerSendingOrderResponse struct {
	OrderId        *uint64    `json:"order_id"`
	OrderTime      *time.Time `json:"order_time"`
	CustomerName   *string    `json:"customer_name"`
	ProductPicture *string    `json:"product_picture"`
}
