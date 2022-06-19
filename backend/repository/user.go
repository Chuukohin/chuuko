package repository

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/request_payload"
	"chuukohin/types/responder"
	"gorm.io/gorm"
)

type userRepository struct {
	db *gorm.DB
}

func NewUserRepository(db *gorm.DB) userRepository {
	return userRepository{db: db}
}

func (r userRepository) GetByEmail(email string) (*models.User, error) {
	var user *models.User
	if result := r.db.First(&user, "email = ?", email); result.Error != nil {
		return nil, result.Error
	}
	return user, nil
}

func (r userRepository) CreateUser(request request_payload.RegisterRequest) (*uint64, error) {
	// * Create user
	user := &models.User{
		Firstname: request.Firstname,
		Lastname:  request.Lastname,
		Password:  request.Password,
		Email:     request.Email,
	}

	if result := database.Gorm.Create(&user); result.Error != nil {
		return nil, &responder.GenericError{
			Message: "Unable to create user",
			Err:     result.Error,
		}
	}

	return user.Id, nil
}
