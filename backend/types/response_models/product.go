package response_models

type Product struct {
	Id          *uint64   `json:"id"`
	SellerId    *uint64   `json:"seller_id"`
	Seller      *Shop     `json:"seller"`
	CategoryId  *uint64   `json:"category_id"`
	Category    *Category `json:"category"`
	Name        *string   `json:"name"`
	Brand       *string   `json:"brand"`
	Price       *uint64   `json:"price"`
	Description *string   `json:"description"`
	PictureId   *uint64   `json:"picture_id"`
	Status      *string   `json:"status"`
}
