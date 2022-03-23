package models

type Favorite struct {
	UserId    *uint64   `gorm:"primaryKey"`
	User      *User     `gorm:"foreignKey:UserId"`
	ProductId *[]uint64 `gorm:"type:integer[]"`
}
