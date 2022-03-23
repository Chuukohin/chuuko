package models

type Picture struct {
	Id         *uint64 `gorm:"primaryKey"`
	PictureUrl *string `gorm:"type:VARCHAR(255); not null"`
}
