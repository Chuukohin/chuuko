package model_shop

import (
	"time"
)

type OrderDetail struct {
	ProductId      *uint64
	TrackingNumber *string
	Status         []*DeliveryDetail
}

type DeliveryDetail struct {
	Status      *string
	Time        *time.Time
	Description *string
}
