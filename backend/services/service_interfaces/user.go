package service_interfaces

import (
	"chuukohin/types/request_payload"
	"chuukohin/types/responder"
)

type UserService interface {
	Login(email string, password string) (*responder.InfoResponse, error)
	Register(request request_payload.RegisterRequest) (*responder.InfoResponse, error)
}
