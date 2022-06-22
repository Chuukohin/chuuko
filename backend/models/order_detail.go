package models

type OrderDetail struct {
	OrderId    *uint64  `gorm:"not null"`
	Order      *Order   `gorm:"foreignKey:OrderId"`
	TrackingNo *string  `gorm:"type:VARCHAR(12)"`
	Received   *bool    `gorm:"not null; default:false"`
	Status     *string  `gorm:"type:VARCHAR(20); default:Request has sent;  not null"`
	Details    *[]uint8 `gorm:"type:jsonb"`
}
