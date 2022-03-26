package models

import (
	"time"
)

type Order struct {
	Id         *uint64    `gorm:"primaryKey"`
	UserId     *uint64    `gorm:"not null"`
	User       *User      `gorm:"foreignKey:UserId"`
	ProductId  *[]uint64  `gorm:"type:integer[]"`
	OrderTime  *time.Time `gorm:"default:current_timestamp; not null"`
	TotalPrice *uint64    `gorm:"not null"`
}
