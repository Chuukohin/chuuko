package repository

import (
	"chuukohin/models"
	"chuukohin/utils/config"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"log"
)

func Init() (*gorm.DB, error) {
	db, err := gorm.Open(postgres.Open(config.C.PostgresLink), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info),
	})
	if err != nil {
		log.Fatal("Unable to connect the database", err)
		return nil, err
	}

	if config.C.AutoMigration {
		log.Println("Initializing the database")
		err := db.AutoMigrate(
			&models.Picture{},
			&models.User{},
			&models.Address{},
			&models.Shop{},
			&models.BankAccount{},
			&models.Card{},
			&models.Category{},
			&models.Product{},
			&models.Order{},
			&models.OrderDetail{},
		)
		if err != nil {
			log.Fatal("Unable to migrate database", err)
			return nil, err
		}
	}
	log.Println("Initialized postgres connection")

	return db, nil
}
