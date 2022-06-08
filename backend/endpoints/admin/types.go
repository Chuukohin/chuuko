package admin

type adminRequest struct {
	AdminToken string `json:"admin_token" validate:"required"`
}
