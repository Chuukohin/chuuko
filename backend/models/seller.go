package models

import "time"

type Seller struct {
	Id              *uint64    `gorm:"primaryKey"`
	UserId          *uint64    `gorm:"not null"`
	User            *User      `gorm:"foreignKey:UserId"`
	AddressId       *uint64    `gorm:"not null"`
	Address         *Address   `gorm:"foreignKey:AddressId"`
	ShopName        *string    `gorm:"type:VARCHAR(255); not null"`
	ShopDescription *string    `gorm:"not null"`
	Firstname       *string    `gorm:"type:VARCHAR(80); not null"`
	Lastname        *string    `gorm:"type:VARCHAR(80); not null"`
	Phone           *string    `gorm:"type:VARCHAR(10); not null"`
	PictureId       *uint64    `gorm:"not null"`
	Picture         *Picture   `gorm:"foreignKey:PictureId"`
	JoinDate        *time.Time `gorm:"not null"`
}
