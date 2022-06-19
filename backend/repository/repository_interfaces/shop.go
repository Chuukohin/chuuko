package repository_interfaces

import "chuukohin/models"

type ShopRepository interface {
	GetSellerByUserId(userId *uint64) (*models.Shop, error)
}
