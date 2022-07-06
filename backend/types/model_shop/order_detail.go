package model_shop

import (
	"time"
)

type OrderDetail struct {
	ProductId      *uint64           `json:"product_id"`
	TrackingNumber *string           `json:"tracking_number"`
	Status         []*DeliveryDetail `json:"status"`
}

type DeliveryDetail struct {
	Status      *string    `json:"status"`
	Time        *time.Time `json:"time"`
	Description *string    `json:"description"`
}
