package enum

type ProductState string

const (
	visible    ProductState = "visible"
	hidden     ProductState = "hidden"
	outOfStock ProductState = "outOfStock"
)

var ProductStatus = struct {
	Visible    ProductState
	Hidden     ProductState
	OutOfStock ProductState
}{
	Visible:    visible,
	Hidden:     hidden,
	OutOfStock: outOfStock,
}
