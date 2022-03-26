package models

import "chuukohin/types/enum"

type Product struct {
	Id          *uint64            `gorm:"primaryKey"`
	SellerId    *uint64            `gorm:"not null"`
	Seller      *Seller            `gorm:"foreignKey:SellerId"`
	CategoryId  *uint64            `gorm:"not null"`
	Category    *Category          `gorm:"foreignKey:CategoryId"`
	Name        *string            `gorm:"type:VARCHAR(255); not null"`
	Brand       *string            `gorm:"type:VARCHAR(80); not null"`
	Price       *uint64            `gorm:"not null"`
	Quantity    *uint64            `gorm:"not null"`
	Description *string            `gorm:"type:text; not null"`
	PictureId   *uint64            `gorm:"type:integer[]"`
	Status      *enum.ProductState `gorm:"type:VARCHAR(40)"`
}
