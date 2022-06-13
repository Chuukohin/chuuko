package models

type Product struct {
	Id          *uint64   `gorm:"primaryKey"`
	SellerId    *uint64   `gorm:"not null"`
	Seller      *Shop     `gorm:"foreignKey:SellerId"`
	CategoryId  *uint64   `gorm:"not null"`
	Category    *Category `gorm:"foreignKey:CategoryId"`
	Name        *string   `gorm:"type:text; not null"`
	Brand       *string   `gorm:"type:VARCHAR(80); not null"`
	Price       *uint64   `gorm:"not null"`
	Description *string   `gorm:"type:text; not null"`
	PictureId   *uint64   `gorm:"not null; default:1"`
	Picture     *Picture  `gorm:"foreignKey:PictureId"`
	Status      *string   `gorm:"type:VARCHAR(40); not null"`
}
