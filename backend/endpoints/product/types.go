package product

type productDetailRequest struct {
	Category    *uint64 `json:"category"`
	Name        *string `json:"name"`
	Description *string `json:"description"`
	Brand       *string `json:"brand"`
	Price       *uint64 `json:"price"`
}
