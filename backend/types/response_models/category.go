package response_models

type Category struct {
	Id        *uint64  `json:"id"`
	Name      *string  `json:"name"`
	PictureId *uint64  `json:"picture_id"`
	Picture   *Picture `json:"picture"`
}
