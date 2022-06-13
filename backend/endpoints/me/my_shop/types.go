package my_shop

import "time"

type myShopGetResponse struct {
	Seller   *sellerData `json:"seller"`
	Products any         `json:"products"`
}

type sellerData struct {
	Name         *string    `json:"name"`
	TotalProduct *uint64    `json:"total_product"`
	JoinDate     *time.Time `json:"join_date"`
}

type product struct {
	Name       *string `json:"name"`
	Price      *uint64 `json:"price"`
	Brand      *string `json:"brand"`
	PictureUrl *string `json:"picture_url"`
}
