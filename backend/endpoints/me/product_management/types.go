package product_management

type product struct {
	Id         *uint64 `json:"id"`
	Name       *string `json:"name"`
	Price      *uint64 `json:"price"`
	Brand      *string `json:"brand"`
	PictureUrl *string `json:"picture_url"`
}
