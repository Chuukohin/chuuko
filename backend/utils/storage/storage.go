package storage

import (
	"os"
	"path/filepath"
)

var (
	RootDir     string
	UsersDir    string
	ShopsDir    string
	ProductsDir string
)

func Init() {
	// Convert directory to absolute path
	if dir, err := filepath.Abs("./static"); err != nil {
		println("UNKNOWN STORAGE PATH")
	} else {
		RootDir = dir
	}

	// Convert directory to absolute path
	if dir, err := filepath.Abs("./static/users"); err != nil {
		println("UNKNOWN USERS PATH")
	} else {
		UsersDir = dir
	}

	// Convert directory to absolute path
	if dir, err := filepath.Abs("./static/shops"); err != nil {
		println("UNKNOWN SHOPS PATH")
	} else {
		ShopsDir = dir
	}

	// Convert directory to absolute path
	if dir, err := filepath.Abs("./static/products"); err != nil {
		println("UNKNOWN PRODUCTS PATH")
	} else {
		ProductsDir = dir
	}

	// Confirm directory is existed
	if _, err := os.Stat(RootDir); os.IsNotExist(err) {
		println("NONEXISTENT STORAGE PATH")
	}

	// Confirm directory is existed
	if _, err := os.Stat(UsersDir); os.IsNotExist(err) {
		println("NONEXISTENT USERS PATH")
	}

	// Confirm directory is existed
	if _, err := os.Stat(ShopsDir); os.IsNotExist(err) {
		println("NONEXISTENT SHOPS PATH")
	}

	// Confirm directory is existed
	if _, err := os.Stat(ProductsDir); os.IsNotExist(err) {
		println("NONEXISTENT PRODUCTS PATH")
	}
}
