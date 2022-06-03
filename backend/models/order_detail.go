package models

import (
	"chuukohin/types/enum"
	"chuukohin/types/model_shop"
)

type OrderDetail struct {
	OrderId    *uint64                   `gorm:"not null"`
	Order      *Order                    `gorm:"foreignKey:OrderId"`
	TrackingNo *string                   `gorm:"type:VARCHAR(12)"`
	Received   *bool                     `gorm:"not null; default:false"`
	Status     *enum.DeliveryStatus      `gorm:"type:VARCHAR(20); default:Request has sent;  not null"`
	Details    []*model_shop.OrderDetail `gorm:"type:jsonb"`
}
