package models

type BankAccount struct {
	Id        *uint64 `gorm:"primaryKey"`
	BankName  *string `gorm:"type:VARCHAR(255); not null"`
	AccountNo *string `gorm:"type:VARCHAR(10); not null"`
}
