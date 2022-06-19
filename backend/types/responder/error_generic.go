package responder

type GenericError struct {
	Code    string `json:"code"`
	Message string `json:"message"`
	Err     error  `json:"err"`
}

func (v *GenericError) Error() string {
	return v.Message
}
