package models

type Favorite struct {
	UserId    *uint64   `gorm:"not null"`
	User      *User     `gorm:"foreignKey:UserId"`
	ProductId *[]uint64 `gorm:"type:integer[]"`
}
