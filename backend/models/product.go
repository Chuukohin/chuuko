package models

type Product struct {
	Id          *uint64   `gorm:"primaryKey"`
	SellerId    *uint64   `gorm:"primaryKey"`
	Seller      *Seller   `gorm:"foreignKey:SellerId"`
	CategoryId  *uint64   `gorm:"primaryKey"`
	Category    *Category `gorm:"foreignKey:CategoryId"`
	Name        *string   `gorm:"type:VARCHAR(255); not null"`
	Brand       *string   `gorm:"type:VARCHAR(80); not null"`
	Price       *uint64   `gorm:"not null"`
	Description *string   `gorm:"type:text; not null"`
	PictureId   *uint64   `gorm:"primaryKey"`
	Picture     *Picture  `gorm:"foreignKey:PictureId"`
	Status      *bool     `gorm:"not null"`
}
