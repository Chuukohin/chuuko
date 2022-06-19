package repository_interfaces

import (
	"chuukohin/models"
	"chuukohin/types/request_payload"
)

type UserRepository interface {
	GetByEmail(email string) (*models.User, error)
	CreateUser(request request_payload.RegisterRequest) (*uint64, error)
}
