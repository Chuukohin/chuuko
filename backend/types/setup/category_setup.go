package setup

type Category struct {
	Name   *string `json:"name"`
	Icon   *string `json:"icon"`
	Id     *uint64 `json:"id"`
	PicUrl *string `json:"pic_url"`
}
