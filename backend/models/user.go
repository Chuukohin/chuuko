package models

import (
	"time"
)

type User struct {
	Id        *uint64    `gorm:"primaryKey"`
	Email     *string    `gorm:"type:VARCHAR(255); not null"`
	Password  *string    `gorm:"type:VARCHAR(255); not null"`
	Firstname *string    `gorm:"type:VARCHAR(80); not null"`
	Lastname  *string    `gorm:"type:VARCHAR(80); not null"`
	AddressId *uint64    `gorm:""`
	Address   *Address   `gorm:"foreignKey:AddressId"`
	PictureId *uint64    `gorm:"default:1"`
	Picture   *Picture   `gorm:"foreignKey:PictureId"`
	JoinDate  *time.Time `gorm:"default:current_timestamp; not null"`
}
