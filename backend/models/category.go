package models

type Category struct {
	Id        *uint64  `gorm:"primaryKey"`
	Name      *string  `gorm:"type:VARCHAR(40); not null"`
	PictureID *uint64  `gorm:"primaryKey"`
	Picture   *Picture `gorm:"foreignKey:PictureId"`
}
