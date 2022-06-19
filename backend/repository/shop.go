package repository

import (
	"chuukohin/models"
	"gorm.io/gorm"
)

type shopRepository struct {
	db *gorm.DB
}

func NewShopRepository(db *gorm.DB) shopRepository {
	return shopRepository{db: db}
}

func (r shopRepository) GetSellerByUserId(userId *uint64) (*models.Shop, error) {
	var seller *models.Shop
	if result := r.db.First(&seller, "user_id = ?", *userId); result.Error != nil {
		return nil, result.Error
	}
	return seller, nil
}
