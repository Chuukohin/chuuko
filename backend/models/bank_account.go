package models

type BankAccount struct {
	Id        *uint64 `gorm:"primaryKey"`
	SellerId  *uint64 `gorm:"not null"`
	Seller    *Shop   `gorm:"foreignKey:SellerId"`
	BankName  *string `gorm:"type:VARCHAR(10); not null"`
	AccountNo *string `gorm:"type:VARCHAR(10); not null"`
}
