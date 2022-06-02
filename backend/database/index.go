package database

import (
	"chuukohin/models"
	"chuukohin/utils/config"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"log"
)

var Gorm *gorm.DB

func Init() {
	db, err := gorm.Open(postgres.Open(config.C.PostgresLink), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info),
	})
	if err != nil {
		log.Fatal("Unable to connect the database", err)
	}

	Gorm = db

	if config.C.AutoMigration {
		log.Println("Initializing the database")
		err := Gorm.AutoMigrate(
			&models.Picture{},
			&models.User{},
			&models.Address{},
			&models.Seller{},
			&models.BankAccount{},
			&models.Card{},
			&models.Category{},
			&models.Product{},
			&models.Favorite{},
			&models.Order{},
			&models.OrderDetail{},
		)
		if err != nil {
			log.Fatal("Unable to migrate database", err)
		}
	}
	log.Println("Initialized postgres connection")
}
