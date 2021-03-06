package models

import (
	"time"
)

type Order struct {
	Id        *uint64    `gorm:"primaryKey"`
	UserId    *uint64    `gorm:"not null"`
	User      *User      `gorm:"foreignKey:UserId"`
	ProductId *uint64    `gorm:"not null"`
	OrderTime *time.Time `gorm:"default:current_timestamp; not null"`
	Price     *uint64    `gorm:"not null"`
}
