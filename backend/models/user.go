package models

import "time"

type User struct {
	Id        *uint64    `gorm:"primaryKey"`
	Email     *string    `gorm:"type:VARCHAR(255); not null"`
	Password  *string    `gorm:"type:VARCHAR(255); not null"`
	Firstname *string    `gorm:"type:VARCHAR(255); not null"`
	Lastname  *string    `gorm:"type:VARCHAR(255); not null"`
	JoinDate  *time.Time `gorm:"not null"`
}
