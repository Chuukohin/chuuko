package models

import "time"

type Seller struct {
	Id            *uint64      `gorm:"primaryKey"`
	UserId        *uint64      `gorm:"primaryKey"`
	User          *User        `gorm:"foreignKey:UserId"`
	AddressId     *uint64      `gorm:"primaryKey"`
	Address       *Address     `gorm:"foreignKey:AddressId"`
	BankAccountId *uint64      `gorm:"primaryKey"`
	BankAccount   *BankAccount `gorm:"foreignKey:BankAccountId"`
	ShopName      *string      `gorm:"type:VARCHAR(255); not null"`
	Firstname     *string      `gorm:"type:VARCHAR(80); not null"`
	Lastname      *string      `gorm:"type:VARCHAR(80); not null"`
	Phone         *string      `gorm:"type:VARCHAR(10); not null"`
	PictureId     *uint64      `gorm:"primaryKey"`
	Picture       *Picture     `gorm:"foreignKey:PictureId"`
	JoinDate      *time.Time   `gorm:"not null"`
}
