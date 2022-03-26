package models

import "chuukohin/types/models"

type OrderDetail struct {
	OrderId    *uint64               `gorm:"not null"`
	Order      *Order                `gorm:"foreignKey:OrderId"`
	ProductId  *uint64               `gorm:"not null"`
	Product    *Product              `gorm:"foreignKey:ProductId"`
	Quantity   *uint64               `gorm:"not null"`
	TrackingNo *string               `gorm:"type:VARCHAR(12)"`
	IsReceived *bool                 `gorm:"not null; default:false"`
	Status     *[]models.OrderDetail `gorm:"type:jsonb"`
}
