package enum

type ProductState string

const (
	selling ProductState = "selling"
	sold    ProductState = "sold"
)

var ProductStatus = struct {
	Selling ProductState
	Sold    ProductState
}{
	Selling: selling,
	Sold:    sold,
}
