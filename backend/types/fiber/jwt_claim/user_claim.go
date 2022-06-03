package jwt_claim

type UserClaim struct {
	UserId   *uint64 `json:"user_id"`
	IsSeller *bool   `json:"is_seller"`
}

func (T *UserClaim) Valid() error {
	return nil
}
