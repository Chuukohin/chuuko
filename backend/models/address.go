package models

type Address struct {
	Id           *uint64 `gorm:"primaryKey"`
	Name         *string `gorm:"type:VARCHAR(80); not null"`
	Phone        *string `gorm:"type:VARCHAR(10); not null"`
	AddressLine1 *string `gorm:"type:VARCHAR(255); not null"`
	AddressLine2 *string `gorm:"type:VARCHAR(255);"`
	Province     *string `gorm:"type:VARCHAR(255); not null"`
	District     *string `gorm:"type:VARCHAR(255); not null"`
	SubDistrict  *string `gorm:"type:VARCHAR(255); not null"`
	PostalCode   *string `gorm:"type:VARCHAR(5); not null"`
}
