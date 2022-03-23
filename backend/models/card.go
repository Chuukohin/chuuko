package models

type Card struct {
	Id          *uint64 `gorm:"primaryKey"`
	UserId      *uint64 `gorm:"primaryKey"`
	User        *User   `gorm:"foreignKey:UserId"`
	Name        *string `gorm:"type:VARCHAR(255); not null"`
	CardNo      *string `gorm:"type:VARCHAR(16); not null"`
	MonthExpire *string `gorm:"type:VARCHAR(2)"`
	YearExpire  *string `gorm:"type:VARCHAR(2)"`
}
