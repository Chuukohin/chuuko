package models

import "time"

type Order struct {
	Id         *uint64    `gorm:"primaryKey"`
	UserId     *uint64    `gorm:"primaryKey"`
	User       *User      `gorm:"foreignKey:UserId"`
	ProductId  *[]uint64  `gorm:"type:integer[]"`
	OrderTime  *time.Time `gorm:"not null"`
	TotalPrice *uint64    `gorm:"not null"`
	DeliveryBy *string    `gorm:"type:VARCHAR(255); not null"`
	TrackingNo *string    `gorm:"type:VARCHAR(20); not null"`
	Status     *string    `gorm:"type:VARCHAR(20); not null"`
}
