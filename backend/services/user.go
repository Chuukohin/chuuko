package services

import (
	"chuukohin/repository/repository_interfaces"
	"chuukohin/types/fiber/jwt_claim"
	"chuukohin/types/request_payload"
	"chuukohin/types/responder"
	"chuukohin/utils/crypto"
	"chuukohin/utils/header"
)

type userService struct {
	userRepo repository_interfaces.UserRepository
	shopRepo repository_interfaces.ShopRepository
}

func NewUserService(userRepo repository_interfaces.UserRepository, shopRepo repository_interfaces.ShopRepository) userService {
	return userService{userRepo: userRepo, shopRepo: shopRepo}
}

func (s userService) Login(email string, password string) (*responder.InfoResponse, error) {
	user, err := s.userRepo.GetByEmail(email)
	if err != nil {
		return nil, &responder.GenericError{
			Message: "User not found",
		}
	}

	// * Check password
	if !crypto.ComparePassword(*user.Password, password) {
		return nil, &responder.GenericError{
			Message: "Password is incorrect",
		}
	}

	// * Create claims
	claims := &jwt_claim.UserClaim{
		UserId: user.Id,
	}

	// * Check seller
	seller, err := s.shopRepo.GetSellerByUserId(user.Id)
	if err != nil {
		sellerId := uint64(0)
		claims.SellerId = &sellerId
	} else {
		claims.SellerId = seller.Id
	}

	// * Sign JWT
	token, tError := header.SignJwt(claims)
	if tError != nil {
		return nil, tError.Err
	}

	return responder.NewInfoResponse(&request_payload.LoginResponse{
		Token: token,
	}), nil
}

func (s userService) Register(request request_payload.RegisterRequest) (*responder.InfoResponse, error) {
	_, err := s.userRepo.GetByEmail(*request.Email)

	// * Check Duplicated Email
	if err == nil {
		return nil, &responder.GenericError{
			Message: "Duplicated email",
		}
	}

	// * Compare Password
	if *request.Password != *request.ConfirmPassword {
		return nil, &responder.GenericError{
			Message: "The Password confirmation does not match",
		}
	}

	// * Hash Password
	hashedPassword, _ := crypto.HashPassword(*request.Password)

	// * change password body
	request.Password = &hashedPassword

	createdUserId, createErr := s.userRepo.CreateUser(request)
	if createErr != nil {
		return nil, &responder.GenericError{
			Message: "Unable to create user",
			Err:     createErr,
		}
	}

	// * Create claims
	sellerId := uint64(0)
	claims := &jwt_claim.UserClaim{
		UserId:   createdUserId,
		SellerId: &sellerId,
	}

	// * Sign JWT
	token, tError := header.SignJwt(claims)
	if tError != nil {
		return nil, tError.Err
	}

	return responder.NewInfoResponse(&request_payload.LoginResponse{
		Token: token,
	}), nil
}
