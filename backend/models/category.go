package models

type Category struct {
	Id        *uint64  `gorm:"primaryKey"`
	Name      *string  `gorm:"type:VARCHAR(40); not null"`
	PictureId *uint64  `gorm:"not null"`
	Picture   *Picture `gorm:"foreignKey:PictureId"`
}
