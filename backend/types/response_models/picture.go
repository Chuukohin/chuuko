package response_models

type Picture struct {
	Id         *uint64 `json:"id"`
	PictureUrl *string `json:"picture_url"`
}
