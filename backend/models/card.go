package models

type Card struct {
	Id          *uint64 `gorm:"primaryKey"`
	UserId      *uint64 `gorm:"not null"`
	User        *User   `gorm:"foreignKey:UserId"`
	Name        *string `gorm:"type:VARCHAR(255); not null"`
	CardNo      *string `gorm:"type:VARCHAR(255); not null"`
	MonthExpire *string `gorm:"type:VARCHAR(2); not null"`
	YearExpire  *string `gorm:"type:VARCHAR(2); not null"`
}
