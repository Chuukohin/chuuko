package models

import "chuukohin/types/model_shop"

type OrderDetail struct {
	OrderId    *uint64                   `gorm:"not null"`
	Order      *Order                    `gorm:"foreignKey:OrderId"`
	TrackingNo *string                   `gorm:"type:VARCHAR(12)"`
	IsReceived *bool                     `gorm:"not null; default:false"`
	Status     *[]model_shop.OrderDetail `gorm:"type:jsonb"`
}
