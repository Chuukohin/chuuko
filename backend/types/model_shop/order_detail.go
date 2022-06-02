package model_shop

import (
	"time"
)

type OrderDetail struct {
	ProductId      *uint64
	TrackingNumber *string
	Status         *[]deliveryDetail
}

type deliveryDetail struct {
	Status      *string
	Time        *time.Time
	Description *string
}
