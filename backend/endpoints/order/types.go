package order

import "time"

type orderUserDetailResponse struct {
	Address *address `json:"address"`
	Card    *card    `json:"card"`
	Product *product `json:"product"`
}

type orderByIdResponse struct {
	Product       *product             `json:"product"`
	Address       *address             `json:"address"`
	OrderDetail   *orderDetail         `json:"order_detail"`
	DeliveryInfo  *deliveryInformation `json:"delivery_info"`
	TrackingOrder *trackingOrder       `json:"tracking_order"`
}

type orderCreate struct {
	ProductId *uint64 `json:"product_id" validate:"required"`
}

type address struct {
	Id           *uint64 `json:"id"`
	Name         *string `json:"name"`
	Phone        *string `json:"phone"`
	AddressLine1 *string `json:"address_line_1"`
	AddressLine2 *string `json:"address_line_2"`
	Province     *string `json:"province"`
	District     *string `json:"district"`
	SubDistrict  *string `json:"sub_district"`
	PostalCode   *string `json:"postal_code"`
}

type card struct {
	Id          *uint64 `json:"id"`
	Name        *string `json:"name"`
	CardNo      *string `json:"card_no"`
	MonthExpire *string `json:"month_expire"`
	YearExpire  *string `json:"year_expire"`
}

type product struct {
	Id         *uint64 `json:"id"`
	Name       *string `json:"name"`
	Price      *uint64 `json:"price"`
	Brand      *string `json:"brand"`
	PictureUrl *string `json:"picture_url"`
}

type orderDetail struct {
	CustomerName *string    `json:"customer_name"`
	OrderId      *uint64    `json:"order_id"`
	OrderTime    *time.Time `json:"order_time"`
	Price        *uint64    `json:"price"`
}

type deliveryInformation struct {
	TrackingNumber *string `json:"tracking_number"`
}

type trackingOrder struct {
	ProductId      *uint64                `json:"product_id"`
	TrackingNumber *string                `json:"tracking_number"`
	Status         []*trackingOrderStatus `json:"status"`
}

type trackingOrderStatus struct {
	Status      *string    `json:"status"`
	Time        *time.Time `json:"time"`
	Description *string    `json:"description"`
}
