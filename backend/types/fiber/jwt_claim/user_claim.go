package jwt_claim

type UserClaim struct {
	UserId   *uint64 `json:"user_id"`
	SellerId *uint64 `json:"seller_id"`
}

func (T *UserClaim) Valid() error {
	return nil
}
