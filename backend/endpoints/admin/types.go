package admin

type adminRequest struct {
	AdminToken string `json:"admin_token" validate:"required"`
}

type MockProduct struct {
	SellerId    *uint64 `json:"seller_id"`
	CategoryId  *uint64 `json:"category_id"`
	Name        *string `json:"name"`
	Description *string `json:"description"`
	Brand       *string `json:"brand"`
	Price       *uint64 `json:"price"`
	PictureLink *string `json:"picture_link"`
}

type ProductFile struct {
	FileName string
}

var ProductFiles = []*ProductFile{
	{
		FileName: "men.json",
	},
	{
		FileName: "women.json",
	},
	{
		FileName: "tops.json",
	},
	{
		FileName: "bottoms.json",
	},
	{
		FileName: "shoes.json",
	},
	{
		FileName: "sports.json",
	},
	{
		FileName: "innerwear.json",
	},
	{
		FileName: "accessories.json",
	},
}
