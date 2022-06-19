package handler

import (
	"chuukohin/services/service_interfaces"
	"chuukohin/types/request_payload"
	"chuukohin/types/responder"
	"chuukohin/utils/check"
	"github.com/gofiber/fiber/v2"
)

type userHandler struct {
	userSrv service_interfaces.UserService
}

func NewUserHandler(userSrv service_interfaces.UserService) userHandler {
	return userHandler{
		userSrv: userSrv,
	}
}

func (h userHandler) Login(c *fiber.Ctx) error {
	body := new(request_payload.LoginRequest)
	if err := c.BodyParser(&body); err != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	user, err := h.userSrv.Login(*body.Email, *body.Password)
	if err != nil {
		return err
	}
	return c.JSON(user)
}

func (h userHandler) Register(c *fiber.Ctx) error {
	body := new(request_payload.RegisterRequest)
	if err := c.BodyParser(&body); err != nil {
		return &responder.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	// * Validate Body
	if err := check.Validator.Struct(body); err != nil {
		return &responder.GenericError{
			Message: "Validate body failed",
			Err:     err,
		}
	}

	// * Validate Password
	if err := check.ValidatePassword(*body.Password); err != nil {
		return err
	}

	user, err := h.userSrv.Register(*body)
	if err != nil {
		return err
	}

	return c.JSON(user)
}
