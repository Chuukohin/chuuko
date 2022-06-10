package product

type productDetailRequest struct {
	CategoryId  *uint64 `json:"category_id" validate:"required"`
	Name        *string `json:"name" validate:"required"`
	Description *string `json:"description" validate:"required"`
	Brand       *string `json:"brand" validate:"required"`
	Price       *uint64 `json:"price" validate:"required"`
}
